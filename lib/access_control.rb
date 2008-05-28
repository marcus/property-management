module AccessControl
  
  class << self
    def map
      mapper = Mapper.new
      yield mapper
      @permissions ||= []
      @permissions += mapper.mapped_permissions
    end
    
    def permissions
      @permissions
    end
    
    def allowed_actions(permission_name)
      perm = @permissions.detect {|p| p.name == permission_name}
      perm ? perm.actions : []
    end
  end
  
  class Mapper
    def permission(name, hash)
      (@permissions ||= []) << Permission.new(name, hash)
    end
    
    def mapped_permissions
      @permissions
    end
  end
  
  class Permission
    attr_reader :name, :actions
    
    def initialize(name, hash)
      @name = name
      @actions = []
      hash.each do |controller, actions|
        if actions.is_a? Array
          @actions << actions.collect {|action| "#{controller}/#{action}"}
        else
          @actions << "#{controller}/#{actions}"
        end
      end
    end
    
  end    
end