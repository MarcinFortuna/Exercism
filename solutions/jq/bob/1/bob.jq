if (.heyBob | test("^\\s*$"; "")) 
    then "Fine. Be that way!" 
elif (.heyBob | test("[A-Z]")) and (.heyBob | test("[a-z]") | not) then
  if (.heyBob | trim | .[-1:]) == "?" 
    then "Calm down, I know what I'm doing!"
  else "Whoa, chill out!" 
  end
elif (.heyBob | trim | .[-1:]) == "?" 
    then "Sure." 
else "Whatever." 
end