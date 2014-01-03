module Opsource::API
  class Network < Core
    def list
      org_endpoint '/network'
      get
    end

    def list_with_location
      org_endpoint "/networkWithLocation"
      get
    end

    def list_in_location(location_id)
      org_endpoint "/networkWithLocation/#{location_id}"
      get
    end

    def show(network_id)
      list_with_location.select{|n| n.id == network_id}
    end

    def natrule_list(network_id)
      org_endpoint "/network/#{network_id}/natrule"
      get
    end

    # name = "10.147.15.11", source_ip = "10.147.15.11"
    def natrule_create(network_id, name, source_ip)
      org_endpoint "/network/#{network_id}/natrule"
      xml_params(name: name, source_ip: source_ip)
      post
    end

    def natrule_delete(network_id, natrule_id)
      org_endpoint "/network/#{network_id}/natrule/#{natrule_id}?delete"
      get
    end

  end
end
