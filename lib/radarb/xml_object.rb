module Radarb
  module XmlObject
    def method_missing(meth)
      instance_eval <<-DEF
        def #{meth}
          node = find_first("./#{meth}")
          if node
            subset = node.find("./#{meth.to_s.chop}")
            if subset.count == 0 && node.child
              node.child.to_s
            elsif subset.count > 0
              subset.to_a
            end
          elsif "#{meth}"[-1,1] == 's'
            []
          end
        end
      DEF
      send(meth)
    end
  end
end

class LibXML::XML::Node
  include Radarb::XmlObject
  undef_method :name, :id
end