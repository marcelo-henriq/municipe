class CitizenStatus < EnumerateIt::Base
  associate_values :active, :inactive
end