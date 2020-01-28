a = [1,2,3]

a.map.each do |nombre|
    if nombre == 3 then
    a.delete(nombre)
    end
end

puts a  
