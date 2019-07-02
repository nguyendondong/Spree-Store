$ ->
  ($ '#country_based').click ->
    show_country()

  ($ '#state_based').click ->
    show_state()

  ($ '#district_based').click ->
    show_district()

  if ($ '#country_based').is(':checked')
    show_country()
  else if ($ '#state_based').is(':checked')
    show_state()
  else
    show_state()
    ($ '#state_based').click()


show_country = ->
  ($ '#state_members :input').each ->
    ($ this).prop 'disabled', true

  ($ '#state_members').hide()

  ($ '#district_members :input').each ->
    ($ this).prop 'disabled', true

  ($ '#district_members').hide()

  ($ '#zone_members :input').each ->
    ($ this).prop 'disabled', true

  ($ '#zone_members').hide()
  ($ '#country_members :input').each ->
    ($ this).prop 'disabled', false

  ($ '#country_members').show()

show_state = ->
  ($ '#country_members :input').each ->
    ($ this).prop 'disabled', true

  ($ '#country_members').hide()

  ($ '#district_members :input').each ->
    ($ this).prop 'disabled', true

  ($ '#district_members').hide()

  ($ '#zone_members :input').each ->
    ($ this).prop 'disabled', true

  ($ '#zone_members').hide()
  ($ '#state_members :input').each ->
    ($ this).prop 'disabled', false

  ($ '#state_members').show()

show_district = ->
	($ '#country_members :input').each ->
    ($ this).prop 'disabled', true

  ($ '#country_members').hide()
  ($ '#zone_members :input').each ->
    ($ this).prop 'disabled', true


  ($ '#state_members :input').each ->
    ($ this).prop 'disabled', true

  ($ '#state_members').hide()
  ($ '#zone_members :input').each ->
    ($ this).prop 'disabled', true

  ($ '#zone_members').hide()
  ($ '#district_members :input').each ->
    ($ this).prop 'disabled', false

  ($ '#district_members').show()