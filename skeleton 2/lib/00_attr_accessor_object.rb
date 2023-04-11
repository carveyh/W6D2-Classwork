class AttrAccessorObject

  #This also works...but doesn't use the lesson's #instance_variable_get and /_set 
  # def self.my_attr_accessor(*names)
  #   names.each do |name|
  #     #Format the attribute symbol with `@`
  #     attr_name = ('@'.concat(name.to_s)).to_sym

  #     #Define a getter with the name
  #     define_method(name) do
  #       #Return the attr @name  
  #       return attr_name
  #     end

  #     #Define a setter
  #     define_method(name.to_s.concat('=')) do |new_val|
  #       attr_name = new_val
  #     end
  #   end
  # end

  #WHEN YOU STRING INTERPOLATE - YOU MUST USE DOUBLE QUOTES!!!!
  def self.my_attr_accessor(*names)
    names.each do |name|
      #Define getter
      define_method(name) do
        instance_variable_get("@#{name}")
      end

      #Define setter
      define_method("#{name}=") do |val|
        instance_variable_set("@#{name}", val)
      end
    end
  end
end


