module Opsource::API
  class Core
    attr_reader :client
    def initialize(client)
      @client = client
    end


    ### client methods

    def log(*args)
      @client.log(*args)
    end

    def org_id
      @client.org_id
    end


    ### request options

    def endpoint(e)
      @endpoint = e
    end

    def org_endpoint(e)
      endpoint("/#{org_id}" + e)
    end

    def query_params(q)
      @query_params = q
    end

    def xml_params(x)
      @xml_params = x
    end


    ### perform request

    def get
      perform :get
    end

    def post
      perform :post
    end

    def perform(method)
      request = @client.build_request(method, @endpoint, request_query_string, request_xml_body)
      response = @client.perform_request(request)

      @client.log_response(request, response)

      # return parsed object if it's good
      if response.success?
        result = @client.parse_response_xml_body(response.body)
        if result['total_count']
          log "#{result['total_count']} total", :yellow, :bold
          result.delete('page_size')
          result.delete('total_count')
          result.delete('page_count')
          result.delete('page_number')
        end
        # unwind some arrays of elements
        result.values.count == 1 ? result.values.first : result
      else
        {}
      end
    end

    def single(results)
      if results.is_a? Array
        results.first
      else
        results
      end
    end


    ### build request

    def request_query_string
      fparams = @client.filter_params || {}
      qparams = @query_params || {}
      params = fparams.merge(qparams)
      @client.url_query(params) if params.present?
    end

    def request_xml_body
      return if @xml_params.blank?
      schema = @xml_params.delete(:schema)
      tag = @xml_params.delete(:tag)

      body = @client.build_request_xml_body(schema, tag, @xml_params)
      log(body, :green)
      body
    end
  end
end