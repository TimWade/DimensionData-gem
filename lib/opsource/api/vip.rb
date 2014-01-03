module Opsource::API
  class VIP < Core
  
  # Real Server section
    def real_servers_list (network_id)
      org_endpoint '/network/#{network_id}/realServer'
      get
    end

    # Examples name = RealServer1, serverId = "415a7f70-1008-42a3-8375-5dcf52636cc5", inService = true/false
    def real_server_create (network-id, name, serverId, inService)
      org_endpoint "/network/#{network_id}/realServer"
      xml_params(name: name, serverId: serverId, inService: inService)
      post
    end


    def real_server_delete (network_id, rserver_id)
      org_endpoint "/network/#{network_id}/realServer/#{rserver_id}?delete"
      get
    end


    def real_server_modify (network_id, rserver_id, inService)
      org_endpoint "/network/#{network_id}/realServer/#{rserver_id}"
      xml_params(inService: inService)
      post
    end

  # Probe section
    def probe_list (network_id)
      org_endpoint "/network/#{network_id}/probe"
      get
    end

    # Note this is for TCP, UDP & ICMP only additional xml fields need to be added to be complete
    # Examples name = Probe1, type = TCP, probeIntervalSeconds = "60", errorCountBeforeServerFail = "5" maxReplyWaitSeconds = "10"
    def probe_create
      org_endpoint "/network/#{network_id}/probe"
      xml_params(name: name, type: type, probeIntervalSeconds: probeIntervalSeconds, errorCountBeforeServerFail: errorCountBeforeServerFail, successCountBeforeServerEnable: successCountBeforeServerEnable, failedProbeIntervalSeconds: failedProbeIntervalSeconds, maxReplyWaitSeconds: maxReplyWaitSeconds)
      post
    end


    def probe_delete (network_id, probe_id)
      org_endpoint "/network/#{network_id}/probe/{probe_id}?delete" 
      get
    end


  # Server Farm Section
    def server_farm_list (network_id)
      org_endpoint "/network/#{network_id}/serverFarm" 
      get
    end

    def server_farm_details (network_id, server_farm_id)
      org_endpoint "/network/#{network_id}/serverFarm/#{server_farm_id}" 
      get
    end

    # Examples name = Probe1, type = TCP, probeIntervalSeconds = "60", errorCountBeforeServerFail = "5" maxReplyWaitSeconds = "10"
    #def server_farm_create (network-id)
     # org_endpoint "/network/#{network_id}/serverFarm"
      #xml_params(name: name, predictor: predictor)
      #post
    #end

    def server_farm_delete (network_id, server_farm_id)
      org_endpoint "/network/#{network_id}/serverFarm/#{server_farm_id}?delete" 
      get
    end

    # Examples realServerId = "RealServer1", realSeverPort = "80"
    def real_server_to_server_farm (network-id, server_farm_id, realServerId, realServerPort)
      org_endpoint "/network/#{network_id}/serverFarm/#{server_farm_id}/addRealServer"
      xml_params(realServerId: realServerId, realSeverPort: realServerPort)
      post
    end

    # Examples realServerId = "RealServer1", realSeverPort = "80"
    def real_server_from_server_farm (network-id, server_farm_id, realServerId, realServerPort)
      org_endpoint "/network/#{network_id}/serverFarm/#{server_farm_id}/removeRealServer"
      xml_params(realServerId: realServerId, realSeverPort: realServerPort)
      post
    end


    # Examples probeId = TCP1
    def probe_to_server_farm (network-id, server_farm_id, probeId)
      org_endpoint "/network/#{network_id}/serverFarm/#{server_farm_id}/addProbe"
      xml_params(probeId: probeId)
      post
    end

    # Examples probeId = TCP1
    def probe_from_server_farm (network-id, server_farm_id, probeId)
      org_endpoint "/network/#{network_id}/serverFarm/#{server_farm_id}/removeProbe"
      xml_params(probeId: probeId)
      post
    end

    # Examples predictor= LEAST_CONNECTIONS | ROUND_ROBIN
    def server_farm_presictor(network-id, server_farm_id, predictor)
      org_endpoint "/network/#{network_id}/serverFarm/#{server_farm_id}
      xml_params(predictor: predictor)
      post
    end

  end
end
