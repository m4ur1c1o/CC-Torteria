class Torta
    @@bake_time = {
      cubana: 8,
      jamon: 5,
      milanesa: 7
    }
  attr_reader :flavour

  def initialize(flavour)
    @flavour = flavour

  end

  def bake_time
      @@bake_time[@flavour.to_sym]
  end

end

class TortaBatch
  attr_reader :tortas, :ready_time
  attr_accessor :cook_time

  def initialize(batch_size, flavour)
    @flavour = flavour
    @batch_size = batch_size
    @tortas = []
    @batch_size.times { @tortas << Torta.new(@flavour) }
    @ready_time = @tortas[0].bake_time
    @cook_time = 0
  end

  def status
    # crudo, casi listo, listo y quemado
    if @cook_time > @ready_time
      "QUEMADO"
    elsif @cook_time == @ready_time
      "LISTO"
    elsif @cook_time == 0
      "Crudo"
    elsif @cook_time > 0 && @cook_time < @ready_time
      "Casi listo"
    end   
  end

end

class Oven
  attr_reader :oven_cook_time, :batch

  def initialize
    @batch_inside = false
    @oven_cook_time = 0
  end

  def getin_batch(batch, cook_time)
    if @batch_inside == false
      @batch_inside = true
      @batch = batch
      @oven_cook_time = cook_time
      "Getting batch in"
    else
      "There's no space inside the oven"
    end
  end

  def update
    if @oven_cook_time > 0
      @oven_cook_time -= 1
      @batch.cook_time += 1
    else 
      puts "Ponle mas tiempo al horno"
    end
    
  end



  def getout_batch

  end

end


# Poder crear toratas
# cubana = Torta.new("cubana")
# jamon = Torta.new("jamon")

# Saber de que son las tortas 
# puts cubana.flavour == "cubana"
# puts jamon.flavour == "jamon"

# Conocer el tiempo de cocción de cada torta
# puts cubana.bake_time == 8
# puts jamon.bake_time == 5

# Poder crear un Oven 
# oven = Oven.new

# Poder crear un batch y cococer sus tortas
# batch_jamon = TortaBatch.new(8,"jamon")
# batch_cubana = TortaBatch.new(5,"cubana")

# Poder ver el batch de tortas
# p batch_jamon.tortas
# p batch_jamon.tortas.first.bake_time

# Meter un batch al oven 
# puts oven.getin_batch(batch_jamon, 5)
# puts oven.getin_batch(batch_cubana, 8)

# Update de como va la torta dentro del Oven







# Driver Code 
batch_jamon = TortaBatch.new(8,"jamon")

oven_1 = Oven.new

puts oven_1.getin_batch(batch_jamon, 10)


# Se hace hasta que se agota el tiempo que le mandamos al Oven 
# until oven_1.oven_cook_time == 0
#   puts "Status Antes: #{oven_1.batch.status}"
#   oven_1.update 
#   puts oven_1.oven_cook_time  
#   puts "Status Despues: #{oven_1.batch.status}"
  
# end


# Sacas la torta cuando ya esta lista 
until oven_1.batch.status == "LISTO"
  puts "Status Antes: #{oven_1.batch.status}"
  oven_1.update 
  puts oven_1.oven_cook_time  
  puts "Status Despues: #{oven_1.batch.status}"
end




# puts oven_1.batch.status
# oven_1.update 
# puts oven_1.oven_cook_time
# puts oven_1.batch.status
# oven_1.update 
# puts oven_1.oven_cook_time
# puts oven_1.batch.status
# oven_1.update 
# puts oven_1.oven_cook_time
# puts oven_1.batch.status
# oven_1.update 
# puts oven_1.oven_cook_time
# puts oven_1.batch.status
# oven_1.update 
# puts oven_1.oven_cook_time
# puts oven_1.batch.status
# oven_1.update 
# puts oven_1.oven_cook_time
# puts oven_1.batch.status

 



