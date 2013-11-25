# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ($) ->

  # Sidebar Toggle

  # Slide Toggles

  # Change Tab BG's

  # Hide/Show other articles

  # Waypoints Scrolling
  goToByScroll = (datasection) ->
    if datasection is 1
      htmlbody.animate
        scrollTop: $(".section[data-section=\"" + datasection + "\"]").offset().top
      , 500, "easeOutQuart"
    else
      htmlbody.animate
        scrollTop: $(".section[data-section=\"" + datasection + "\"]").offset().top + 70
      , 500, "easeOutQuart"
  $(".btn-navbar").click ->
    $("html").toggleClass "expanded"

  $("#section3 .button").on "click", ->
    section = $(this).parent()
    section.toggle()
    section.siblings(".slide").slideToggle "2000", "easeInQuart"

  $("#section3 .read-more").on "click", ->
    section = $(this).parent()
    section.toggle()
    section.siblings(".slide").slideToggle "2000", "easeInQuart"

  $("#section4 .article-tags li").on "click", ->
    section = $(this).parents(".span4")
    category = $(this).attr("data-blog")
    articles = section.siblings()
    $(this).siblings(".current").removeClass "current"
    $(this).addClass "current"
    section.siblings(".current").removeClass("current").hide()
    $(articles).each (index) ->
      newCategory = $(this).attr("data-blog")
      $(this).slideDown("1000", "easeInQuart").addClass "current"  if newCategory is category


  links = $(".navigation").find("li")
  button = $(".intro button")
  section = $("section")
  mywindow = $(window)
  htmlbody = $("html,body")
  section.waypoint (direction) ->
    datasection = $(this).attr("data-section")
    if direction is "down"
      $(".navigation li[data-section=\"" + datasection + "\"]").addClass("active").siblings().removeClass "active"
    else
      newsection = parseInt(datasection) - 1
      $(".navigation li[data-section=\"" + newsection + "\"]").addClass("active").siblings().removeClass "active"

  mywindow.scroll ->
    if mywindow.scrollTop() is 0
      $(".navigation li[data-section=\"1\"]").addClass "active"
      $(".navigation li[data-section=\"2\"]").removeClass "active"

  links.click (e) ->
    e.preventDefault()
    datasection = $(this).attr("data-section")
    goToByScroll datasection

  button.click (e) ->
    e.preventDefault()
    datasection = $(this).attr("data-section")
    goToByScroll datasection


  # Snap to scroll (optional)

  #
  #
  #    section.waypoint(function (direction) {
  #
  #        var nextpos = $(this).attr('data-section');
  #        var prevpos = $(this).prev().attr('data-section');
  #
  #        if (nextpos != 1) {
  #	        if (direction === 'down') {
  #	            htmlbody.animate({
  #		            scrollTop: $('.section[data-section="' + nextpos + '"]').offset().top
  #		        }, 750, 'easeOutQuad');
  #	        }
  #	        else {
  #	            htmlbody.animate({
  #		            scrollTop: $('.section[data-section="' + prevpos + '"]').offset().top
  #		        }, 750, 'easeOutQuad');
  #	        }
  #        }
  #
  #
  #    }, { offset: '60%' });
  #
  #

  # Redirect external links
  $("a[rel='external']").click ->
    @target = "_blank"


  # Modernizr SVG backup
  unless Modernizr.svg
    $("img[src*=\"svg\"]").attr "src", ->
      $(this).attr("src").replace ".svg", ".png"


