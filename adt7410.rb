#
# PlatoDevice::ADT7410 class
#
module PlatoDevice
  class ADT7410 < Plato::Sensor
    I2CADDR = 0x48
    REG_TEMP = 0

    def initialize(addr=I2CADDR, ndigits=3, unit=:C)
      @i2c = Plato::I2C.open(addr)
      @ndig = ndigits
      @unit = unit
    end

    def temperature(unit=nil)
        uint = @unit unless unit
        tmpary = @i2c.read(0x00, 1)
        tmpary2 = @i2c.read(0x01, 1)
        t = (tmpary[0] << 8) | tmpary2[0]
        t= (t >> 3)
        if t >= (0x1000) then
            t=t-8192
        end
        t=t/16
        t = t-273 if unit == :F   # Celsius temp. -> Fahrenheit temp.
        t.round(@ndig)
    end

    def read
      temperature
    end

    def unit=(u)
      @unit = u
    end
  end
end
