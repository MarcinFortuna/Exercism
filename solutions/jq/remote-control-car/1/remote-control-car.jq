def new_remote_control_car:
  # Populate the object with the required attributes
  {
      "battery_percentage": 100,
      "distance_driven_in_meters": 0,
      "nickname": null
  }
;

def new_remote_control_car(nickname):
  # Populate the object with the required attributes
  {
      "battery_percentage": 100,
      "distance_driven_in_meters": 0,
      "nickname": nickname
  }
;

def display_distance:
  # Implement the required output string
  .["distance_driven_in_meters"]|tostring + " meters"
;

def display_battery:
  # Implement the required output string
  if .["battery_percentage"] == 0 then "Battery empty" else "Battery at " + (.["battery_percentage"]|tostring) + "%" end
;

def drive:
  # Update the input's attributes as required
  {
      "battery_percentage": if .["battery_percentage"] == 0 then 0 else .["battery_percentage"] - 1 end,
      "distance_driven_in_meters": if .["battery_percentage"] == 0 then .["distance_driven_in_meters"] else .["distance_driven_in_meters"] + 20 end,
      "nickname": .["nickname"]
  }
;
