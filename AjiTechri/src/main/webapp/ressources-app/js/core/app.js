
; (function (window, document, $) {
  "use strict"
  var $html = $("html")
  var $body = $("body")
  var $danger = "#FF5B5C"
  var $primary = "#5A8DEE"
  var $primary_lighten = "#e7edf3"
  var $warning = "#FDAC41"
  var $textcolor = "#304156"

  function scrollTopFn(){
    var $scrollTop = $(window).scrollTop();
    if ($scrollTop > 60) {
      $("body").addClass("navbar-scrolled");
    }else{
      $("body").removeClass("navbar-scrolled");
    }
    if ($scrollTop > 20) {
      $("body").addClass("page-scrolled");
    }
    else{
      $("body").removeClass("page-scrolled");
    }
  }
  $(window).scroll(function () {
    scrollTopFn();
  });

  $(window).on("load", function () {
    var rtl
    var compactMenu = false 

    if ($body.hasClass("menu-collapsed")) {
      compactMenu = true
    }

    if ($("html").data("textdirection") == "rtl") {
      rtl = true
    }

    setTimeout(function () {
      $html.removeClass("loading").addClass("loaded")
    }, 1200)

    $.app.menu.init(compactMenu)

    $.each($(".menu-livicon"), function (i) {
      var $this = $(this),
        icon = $this.data("icon"),
        iconStyle = $("#main-menu-navigation").data("icon-style")

      $this.addLiviconEvo({
        name: icon,
        style: iconStyle,
        duration: 0.85,
        strokeWidth: "1.3px",
        eventOn: "none",
        strokeColor: menuIconColorsObj.iconStrokeColor,
        solidColor: menuIconColorsObj.iconSolidColor,
        fillColor: menuIconColorsObj.iconFillColor,
        strokeColorAlt: menuIconColorsObj.iconStrokeColorAlt,
        afterAdd: function () {
          if (i === $(".main-menu-content .menu-livicon").length - 1) {
            $(".main-menu-content .nav-item a").on("mouseenter", function () {
              if ($(".main-menu-content .menu-livicon").length) {
                $(".main-menu-content .menu-livicon").stopLiviconEvo()
                $(this)
                  .find(".menu-livicon")
                  .playLiviconEvo()
              }
            })
          }
        }
      })
    })

    function updateLivicon(el) {
      el.updateLiviconEvo({
        strokeColor: menuActiveIconColorsObj.iconStrokeColor,
        solidColor: menuActiveIconColorsObj.iconSolidColor,
        fillColor: menuActiveIconColorsObj.iconFillColor,
        strokeColorAlt: menuActiveIconColorsObj.iconStrokeColorAlt
      })
    }

    var config = {
      speed: 300 
    }
    if ($.app.nav.initialized === false) {
      $.app.nav.init(config)
    }

    Unison.on("change", function (bp) {
      $.app.menu.change(compactMenu)
    })

    $('[data-toggle="tooltip"]').tooltip({
      container: "body"
    })

 
    $(".tooltip-horizontal-bookmark").tooltip({
      customClass: "tooltip-horizontal-bookmark"
    })

    if ($(".navbar-hide-on-scroll").length > 0) {
      $(".navbar-hide-on-scroll.fixed-top").headroom({
        offset: 205,
        tolerance: 5,
        classes: {
          initial: "headroom",
          pinned: "headroom--pinned-top",
          unpinned: "headroom--unpinned-top"
        }
      })
      $(".navbar-hide-on-scroll.fixed-bottom").headroom({
        offset: 205,
        tolerance: 5,
        classes: {
          initial: "headroom",
          pinned: "headroom--pinned-bottom",
          unpinned: "headroom--unpinned-bottom"
        }
      })
    }

    $('a[data-action="collapse"]').on("click", function (e) {
      e.preventDefault()
      $(this)
        .closest(".card")
        .children(".card-content")
        .collapse("toggle")
      $(this)
        .closest(".card")
        .children(".card-header")
        .css("padding-bottom", "1.5rem")
      $(this)
        .closest(".card")
        .find('[data-action="collapse"]')
        .toggleClass("rotate")
    })

    $('a[data-action="expand"]').on("click", function (e) {
      e.preventDefault()
      $(this)
        .closest(".card")
        .find('[data-action="expand"] i')
        .toggleClass("bx-fullscreen bx-exit-fullscreen")
      $(this)
        .closest(".card")
        .toggleClass("card-fullscreen")
    })

    $(".scrollable-container").each(function () {
      var scrollable_container = new PerfectScrollbar($(this)[0], {
        wheelPropagation: false
      })
    })

    $('a[data-action="reload"]').on("click", function () {
      var block_ele = $(this)
        .closest(".card")
        .find(".card-content")
      var reloadActionOverlay
      if ($body.hasClass("dark-layout")) {
        var reloadActionOverlay = "#10163a"
      } else {
        var reloadActionOverlay = "#fff"
      }
      block_ele.block({
        message:
          '<div class="bx bx-sync icon-spin font-medium-2 text-primary"></div>',
        timeout: 2000, 
        overlayCSS: {
          backgroundColor: reloadActionOverlay,
          cursor: "wait"
        },
        css: {
          border: 0,
          padding: 0,
          backgroundColor: "none"
        }
      })
    })

    $('a[data-action="close"]').on("click", function () {
      $(this)
        .closest(".card")
        .removeClass()
        .slideUp("fast")
    })

    setTimeout(function () {
      $(".row.match-height").each(function () {
        $(this)
          .find(".card")
          .not(".card .card")
          .matchHeight() 
      })
    }, 500)

    $('.card .heading-elements a[data-action="collapse"]').on(
      "click",
      function () {
        var $this = $(this),
          card = $this.closest(".card")
        var cardHeight

        if (parseInt(card[0].style.height, 10) > 0) {
          cardHeight = card.css("height")
          card.css("height", "").attr("data-height", cardHeight)
        } else {
          if (card.data("height")) {
            cardHeight = card.data("height")
            card.css("height", cardHeight).attr("data-height", "")
          }
        }
      }
    )

    $(".main-menu-content")
      .find("li.active")
      .parents("li")
      .addClass("sidebar-group-active")

    if ($(".nav-item.active .menu-livicon").length) {
      updateLivicon($(".nav-item.active .menu-livicon"))
    }

    if ($(".main-menu-content li.sidebar-group-active .menu-livicon").length) {
      updateLivicon(
        $(".main-menu-content li.sidebar-group-active .menu-livicon")
      )
    }

    var menuType = $body.data("menu")
    if (menuType != "horizontal-menu" && compactMenu === false) {
      $(".main-menu-content")
        .find("li.active")
        .parents("li")
        .addClass("open")
    }
    if (menuType == "horizontal-menu") {
      $(".main-menu-content")
        .find("li.active")
        .parents("li:not(.nav-item)")
        .addClass("open")
      $(".main-menu-content")
        .find("li.active")
        .parents("li")
        .addClass("active")
    }

    $(".heading-elements-toggle").on("click", function () {
      $(this)
        .next(".heading-elements")
        .toggleClass("visible")
    })

    var chartjsDiv = $(".chartjs"),
      canvasHeight = chartjsDiv.children("canvas").attr("height")
    chartjsDiv.css("height", canvasHeight)

    if ($body.hasClass("boxed-layout")) {
      if ($body.hasClass("vertical-overlay-menu")) {
        var menuWidth = $(".main-menu").width()
        var contentPosition = $(".app-content").position().left
        var menuPositionAdjust = contentPosition - menuWidth
        if ($body.hasClass("menu-flipped")) {
          $(".main-menu").css("right", menuPositionAdjust + "px")
        } else {
          $(".main-menu").css("left", menuPositionAdjust + "px")
        }
      }
    }

    $(".custom-file input").change(function (e) {
      $(this)
        .next(".custom-file-label")
        .html(e.target.files[0].name)
    })


    $(".char-textarea").on("keyup", function (event) {
      checkTextAreaMaxLength(this, event)
      $(this).addClass("active")
    })

    
    function checkTextAreaMaxLength(textBox, e) {
      var maxLength = parseInt($(textBox).data("length"))

      if (!checkSpecialKeys(e)) {
        if (textBox.value.length < maxLength - 1)
          textBox.value = textBox.value.substring(0, maxLength)
      }
      $(".char-count").html(textBox.value.length)

      if (textBox.value.length > maxLength) {
        $(".counter-value").css("background-color", $danger)
        $(".char-textarea").css("color", $danger)
        $(".char-textarea").addClass("max-limit")
      } else {
        $(".counter-value").css("background-color", $primary)
        $(".char-textarea").css("color", $textcolor)
        $(".char-textarea").removeClass("max-limit")
      }

      return true
    }
    
    function checkSpecialKeys(e) {
      if (
        e.keyCode != 8 &&
        e.keyCode != 46 &&
        e.keyCode != 37 &&
        e.keyCode != 38 &&
        e.keyCode != 39 &&
        e.keyCode != 40
      )
        return false
      else return true
    }

    $(".content-overlay").on("click", function () {
      $(".search-list").removeClass("show")
      $(".app-content").removeClass("show-overlay")
      $(".bookmark-wrapper .bookmark-input").removeClass("show")
    })

    var container = document.getElementsByClassName("main-menu-content")
    if (container.length > 0) {
      container[0].addEventListener("ps-scroll-y", function () {
        if (
          $(this)
            .find(".ps__thumb-y")
            .position().top > 0
        ) {
          $(".shadow-bottom").css("display", "block")
        } else {
          $(".shadow-bottom").css("display", "none")
        }
      })
    }
  })

  $(document).on("click", ".sidenav-overlay", function (e) {
    $.app.menu.hide()
    return false
  })

  if (typeof Hammer !== "undefined") {
    var swipeInElement = document.querySelector(".drag-target")

    if ($(swipeInElement).length > 0) {
      var swipeInMenu = new Hammer(swipeInElement)

      swipeInMenu.on("panright", function (ev) {
        if ($body.hasClass("vertical-overlay-menu")) {
          $.app.menu.open()
          return false
        }
      })
    }

    setTimeout(function () {
      var swipeOutElement = document.querySelector(".main-menu")
      var swipeOutMenu

      if ($(swipeOutElement).length > 0) {
        swipeOutMenu = new Hammer(swipeOutElement)

        swipeOutMenu.get("pan").set({
          direction: Hammer.DIRECTION_ALL,
          threshold: 100
        })

        swipeOutMenu.on("panleft", function (ev) {
          if ($body.hasClass("vertical-overlay-menu")) {
            $.app.menu.hide()
            return false
          }
        })
      }
    }, 300)

    var swipeOutOverlayElement = document.querySelector(".sidenav-overlay")

    if ($(swipeOutOverlayElement).length > 0) {
      var swipeOutOverlayMenu = new Hammer(swipeOutOverlayElement)

      swipeOutOverlayMenu.on("panleft", function (ev) {
        if ($body.hasClass("vertical-overlay-menu")) {
          $.app.menu.hide()
          return false
        }
      })
    }
  }

  $(document).on("click", ".menu-toggle, .modern-nav-toggle", function (e) {
    e.preventDefault()

    $.app.menu.toggle()

    setTimeout(function () {
      $(window).trigger("resize")
    }, 200)

    if ($("#collapsed-sidebar").length > 0) {
      setTimeout(function () {
        if ($body.hasClass("menu-expanded") || $body.hasClass("menu-open")) {
          $("#collapsed-sidebar").prop("checked", false)
        } else {
          $("#collapsed-sidebar").prop("checked", true)
        }
      }, 1000)
    }

    if (
      $(
        ".vertical-overlay-menu .navbar-with-menu .navbar-container .navbar-collapse"
      ).hasClass("show")
    ) {
      $(
        ".vertical-overlay-menu .navbar-with-menu .navbar-container .navbar-collapse"
      ).removeClass("show")
    }

    return false
  })

  $(".navigation")
    .find("li")
    .has("ul")
    .addClass("has-sub")

  $(".carousel").carousel({
    interval: 2000
  })

  $(".nav-link-expand").on("click", function (e) {
    if (typeof screenfull != "undefined") {
      if (screenfull.enabled) {
        screenfull.toggle()
      }
    }
  })
  if (typeof screenfull != "undefined") {
    if (screenfull.enabled) {
      $(document).on(screenfull.raw.fullscreenchange, function () {
        if (screenfull.isFullscreen) {
          $(".nav-link-expand")
            .find("i")
            .toggleClass("bx-exit-fullscreen bx-fullscreen")
          $("html").addClass("full-screen")
        } else {
          $(".nav-link-expand")
            .find("i")
            .toggleClass("bx-fullscreen bx-exit-fullscreen")
          $("html").removeClass("full-screen")
        }
      })
    }
  }
  $(document).ready(function () {

    $(".step-icon").each(function () {
      var $this = $(this)
      if ($this.siblings("span.step").length > 0) {
        $this.siblings("span.step").empty()
        $(this).appendTo($(this).siblings("span.step"))
      }
    })
  })

  $(window).resize(function () {
    $.app.menu.manualScroller.updateHeight()
    var container = document.getElementsByClassName("main-menu-content")
    if (container.length > 0) {
      container[0].addEventListener("ps-scroll-y", function () {
        if (
          $(this)
            .find(".ps__thumb-y")
            .position().top > 0
        ) {
          $(".shadow-bottom").css("display", "block")
        } else {
          $(".shadow-bottom").css("display", "none")
        }
      })
    }
  })

  $("#sidebar-page-navigation").on("click", "a.nav-link", function (e) {
    e.preventDefault()
    e.stopPropagation()
    var $this = $(this),
      href = $this.attr("href")
    var offset = $(href).offset()
    var scrollto = offset.top - 80 
    $("html, body").animate(
      {
        scrollTop: scrollto
      },
      0
    )
    setTimeout(function () {
      $this
        .parent(".nav-item")
        .siblings(".nav-item")
        .children(".nav-link")
        .removeClass("active")
      $this.addClass("active")
    }, 100)
  })

  i18next
    .use(window.i18nextXHRBackend)
    .init({
      debug: false,
      fallbackLng: "en",
      backend: {
        loadPath: "../ressources-app/data/locales/{{lng}}.json"
      },
      returnObjects: true
    },
      function (err, t) {
        jqueryI18next.init(i18next, $)
      }
    )

  $(".dropdown-language .dropdown-item").on("click", function () {
    var $this = $(this)
    $this.siblings(".selected").removeClass("selected")
    $this.addClass("selected")
    var selectedLang = $this.text()
    var selectedFlag = $this.find(".flag-icon").attr("class")
    $("#dropdown-flag .selected-language").text(selectedLang)
    $("#dropdown-flag .flag-icon")
      .removeClass()
      .addClass(selectedFlag)
    var currentLanguage = $this.data("language")
    i18next.changeLanguage(currentLanguage, function (err, t) {
      $(".main-menu").localize()
    })
  })

 
  var $filename = $(".search-input input").data("search")

  $(".bookmark-wrapper .bookmark-star").on("click", function (e) {
    e.stopPropagation()
    $(".bookmark-wrapper .bookmark-input").toggleClass("show")
    $(".bookmark-wrapper .bookmark-input input").val("")
    $(".bookmark-wrapper .bookmark-input input").blur()
    $(".bookmark-wrapper .bookmark-input input").focus()
    $(".bookmark-wrapper .search-list").addClass("show")

    var arrList = $("ul.nav.navbar-nav.bookmark-icons li"),
      $arrList = "",
      $activeItemClass = ""

    $("ul.search-list li").remove()

    for (var i = 0; i < arrList.length; i++) {
      if (i === 0) {
        $activeItemClass = "current_item"
      } else {
        $activeItemClass = ""
      }
      $arrList +=
        '<li class="auto-suggestion d-flex align-items-center justify-content-between cursor-pointer ' +
        $activeItemClass +
        '">' +
        '<a class="d-flex align-items-center justify-content-between w-100" href=' +
        arrList[i].firstChild.href +
        ">" +
        '<div class="d-flex justify-content-start">' +
        '<span class="mr-75 ' +
        arrList[i].firstChild.firstChild.className +
        '"  data-icon="' +
        arrList[i].firstChild.firstChild.className +
        '"></span>' +
        "<span>" +
        arrList[i].firstChild.dataset.originalTitle +
        "</span>" +
        "</div>" +
        '<span class="float-right bookmark-icon bx bx-star warning"></span>' +
        "</a>" +
        "</li>"
    }
    $("ul.search-list").append($arrList)
  })

  $(".nav-link-search").on("click", function () {
    var $this = $(this)
    var searchInput = $(this)
      .parent(".nav-search")
      .find(".search-input")
    searchInput.addClass("open")
    $(".search-input input").focus()
    $(".search-input .search-list li").remove()
    $(".search-input .search-list").addClass("show")
    $(".bookmark-wrapper .bookmark-input").removeClass("show")
  })

  $(".search-input-close i").on("click", function () {
    var $this = $(this),
      searchInput = $(this).closest(".search-input")
    if (searchInput.hasClass("open")) {
      searchInput.removeClass("open")
      $(".search-input input").val("")
      $(".search-input input").blur()
      $(".search-input .search-list").removeClass("show")
      if ($(".app-content").hasClass("show-overlay")) {
        $(".app-content").removeClass("show-overlay")
      }
    }
  })

  $(".app-content").on("click", function () {
    var $this = $(".search-input-close"),
      searchInput = $($this).parent(".search-input")
    if (searchInput.hasClass("open")) {
      searchInput.removeClass("open")
    }
  })

  $(".search-input .input").on("keyup", function (e) {
    if (e.keyCode !== 38 && e.keyCode !== 40 && e.keyCode !== 13) {
      if (e.keyCode == 27) {
        $(".app-content").removeClass("show-overlay")
        $(".bookmark-input input").val("")
        $(".bookmark-input input").blur()
        $(".search-input input").val("")
        $(".search-input input").blur()
        $(".search-input").removeClass("open")
        if ($(".search-list").hasClass("show")) {
          $(this).removeClass("show")
          $(".search-input").removeClass("show")
        }
      }

      var value = $(this)
        .val()
        .toLowerCase(), 
        activeClass = "",
        bookmark = false,
        liList = $("ul.search-list li") 
      liList.remove()
      if (
        $(this)
          .parent()
          .hasClass("bookmark-input")
      ) {
        bookmark = true
      }

      if (value != "") {
        $(".app-content").addClass("show-overlay")

        if ($(".bookmark-input").focus()) {
          $(".bookmark-input .search-list").addClass("show")
        } else {
          $(".search-input .search-list").addClass("show")
          $(".bookmark-input .search-list").removeClass("show")
        }
        if (bookmark === false) {
          $(".search-input .search-list").addClass("show")
          $(".bookmark-input .search-list").removeClass("show")
        }

        var $startList = "",
          $otherList = "",
          $htmlList = "",
          $activeItemClass = "",
          $bookmarkIcon = "",
          a = 0

        $.getJSON("../../../app-assets/data/" + $filename + ".json", function (
          data
        ) {
          for (var i = 0; i < data.listItems.length; i++) {
            if (bookmark === true) {
              activeClass = "" 
              var arrList = $("ul.nav.navbar-nav.bookmark-icons li"),
                $arrList = ""
              for (var j = 0; j < arrList.length; j++) {
                if (
                  data.listItems[i].name ===
                  arrList[j].firstChild.dataset.originalTitle
                ) {
                  activeClass = " warning"
                  break
                } else {
                  activeClass = ""
                }
              }
              $bookmarkIcon =
                '<span class="float-right bookmark-icon bx bx-star' +
                activeClass +
                '"></span>'
            }
            if (
              data.listItems[i].name.toLowerCase().indexOf(value) == 0 &&
              a < 10 || !(data.listItems[i].name.toLowerCase().indexOf(value) == 0) &&
              data.listItems[i].name.toLowerCase().indexOf(value) > -1 &&
              a < 10
            ) {
              if (a === 0) {
                $activeItemClass = "current_item"
              } else {
                $activeItemClass = ""
              }
              $startList +=
                '<li class="auto-suggestion d-flex align-items-center justify-content-between cursor-pointer ' +
                $activeItemClass +
                '">' +
                '<a class="d-flex align-items-center justify-content-between w-100" href=' +
                data.listItems[i].url +
                ">" +
                '<div class="d-flex justify-content-start">' +
                '<span class="mr-75 ' +
                data.listItems[i].icon +
                '" data-icon="' +
                data.listItems[i].icon +
                '"></span>' +
                "<span>" +
                data.listItems[i].name +
                "</span>" +
                "</div>" +
                $bookmarkIcon +
                "</a>" +
                "</li>"
              a++
            }
          }
          for (var i = 0; i < data.listItems.length; i++) {
            if (bookmark === true) {
              activeClass = "" 
              var arrList = $("ul.nav.navbar-nav.bookmark-icons li"),
                $arrList = ""
              for (var j = 0; j < arrList.length; j++) {
                if (
                  data.listItems[i].name ===
                  arrList[j].firstChild.dataset.originalTitle
                ) {
                  activeClass = " warning"
                } else {
                  activeClass = ""
                }
              }
              $bookmarkIcon =
                '<span class="float-right bookmark-icon bx bx-star' +
                activeClass +
                '"></span>'
            }
            if (
              !(data.listItems[i].name.toLowerCase().indexOf(value) == 0) &&
              data.listItems[i].name.toLowerCase().indexOf(value) > -1 &&
              a < 10
            ) {
              if (a === 0) {
                $activeItemClass = "current_item"
              } else {
                $activeItemClass = ""
              }
              $otherList +=
                '<li class="auto-suggestion d-flex align-items-center justify-content-between cursor-pointer ' +
                $activeItemClass +
                '">' +
                '<a class="d-flex align-items-center justify-content-between w-100" href=' +
                data.listItems[i].url +
                ">" +
                '<div class="d-flex justify-content-start">' +
                '<span class="mr-75 ' +
                data.listItems[i].icon +
                '" data-icon="' +
                data.listItems[i].icon +
                '"></span>' +
                "<span>" +
                data.listItems[i].name +
                "</span>" +
                "</div>" +
                $bookmarkIcon +
                "</a>" +
                "</li>"
              a++
            }
          }
          if ($startList == "" && $otherList == "") {
            $otherList =
              '<li class="auto-suggestion d-flex align-items-center justify-content-between cursor-pointer">' +
              '<a class="d-flex align-items-center justify-content-between w-100">' +
              '<div class="d-flex justify-content-start">' +
              '<span class="mr-75 bx bx-error-circle"></span>' +
              "<span>No results found.</span>" +
              "</div>" +
              "</a>" +
              "</li>"
          }

          $htmlList = $startList.concat($otherList) 
          $("ul.search-list").html($htmlList) 
        })
      } else {
        if (bookmark === true) {
          var arrList = $("ul.nav.navbar-nav.bookmark-icons li"),
            $arrList = ""
          for (var i = 0; i < arrList.length; i++) {
            if (i === 0) {
              $activeItemClass = "current_item"
            } else {
              $activeItemClass = ""
            }
            $arrList +=
              '<li class="auto-suggestion d-flex align-items-center justify-content-between cursor-pointer">' +
              '<a class="d-flex align-items-center justify-content-between w-100" href=' +
              arrList[i].firstChild.href +
              ">" +
              '<div class="d-flex justify-content-start">' +
              '<span class="mr-75 ' +
              arrList[i].firstChild.firstChild.className +
              '"  data-icon="' +
              arrList[i].firstChild.firstChild.className +
              '"></span>' +
              "<span>" +
              arrList[i].firstChild.dataset.originalTitle +
              "</span>" +
              "</div>" +
              '<span class="float-right bookmark-icon bx bx-star warning"></span>' +
              "</a>" +
              "</li>"
          }
          $("ul.search-list").append($arrList)
        } else {
          if ($(".app-content").hasClass("show-overlay")) {
            $(".app-content").removeClass("show-overlay")
          }
          if ($(".search-list").hasClass("show")) {
            $(".search-list").removeClass("show")
          }
        }
      }
    }
  })

  $(document).on("mouseenter", ".search-list li", function (e) {
    $(this)
      .siblings()
      .removeClass("current_item")
    $(this).addClass("current_item")
  })
  $(document).on("click", ".search-list li", function (e) {
    e.stopPropagation()
  })

  $("html").on("click", function ($this) {
    if (!$($this.target).hasClass("bookmark-icon")) {
      if ($(".bookmark-input .search-list").hasClass("show")) {
        $(".bookmark-input .search-list").removeClass("show")
      }
      if ($(".bookmark-input").hasClass("show")) {
        $(".bookmark-input").removeClass("show")
      }
    }
  })

  $(document).on(
    "click",
    ".bookmark-input .search-list .bookmark-icon",
    function (e) {
      e.stopPropagation()
      if ($(this).hasClass("warning")) {
        $(this).removeClass("warning")
        var arrList = $("ul.nav.navbar-nav.bookmark-icons li")
        for (var i = 0; i < arrList.length; i++) {
          if (
            arrList[i].firstChild.dataset.originalTitle ==
            $(this).parent()[0].innerText
          ) {
            arrList[i].remove()
          }
        }
        e.preventDefault()
      } else {
        var arrList = $("ul.nav.navbar-nav.bookmark-icons li")
        $(this).addClass("warning")
        e.preventDefault()
        var $url = $(this).parent()[0].href,
          $name = $(this).parent()[0].innerText,
          $icon = $(this).parent()[0].firstChild.firstChild.dataset.icon,
          $listItem = "",
          $listItemDropdown = ""
        $listItem =
          '<li class="nav-item d-none d-lg-block">' +
          '<a class="nav-link" href="' +
          $url +
          '" data-toggle="tooltip" data-placement="top" title="' +
          $name +
          '">' +
          '<i class="ficon ' +
          $icon +
          '"></i>' +
          "</a>" +
          "</li>"
        $("ul.nav.bookmark-icons").append($listItem)
        $('[data-toggle="tooltip"]').tooltip()
      }
    }
  )

  $(window).on("keydown", function (e) {
    var $current = $(".search-list li.current_item"),
      $next,
      $prev
    if (e.keyCode === 40) {
      $next = $current.next()
      $current.removeClass("current_item")
      $current = $next.addClass("current_item")
    } else if (e.keyCode === 38) {
      $prev = $current.prev()
      $current.removeClass("current_item")
      $current = $prev.addClass("current_item")
    }

    if (e.keyCode === 13 && $(".search-list li.current_item").length > 0) {
      var selected_item = $(".search-list li.current_item a")
      window.location = selected_item.attr("href")
      $(selected_item).trigger("click")
    }
  })

  var $scrollTop = $(window).scrollTop()
  if ($scrollTop > 20) {
    $(".navbar-sticky .main-header-navbar").css({
      "background-color": "#ffff",
      "box-shadow": "-8px 12px 18px 0 rgba(25, 42, 70, 0.13)"
    })
    $(".navbar-static .main-header-navbar").css({
      "background-color": "transparent",
      "box-shadow": "none"
    })
  }

  $(window).scroll(function () {
    if ($(this).scrollTop() > 20) {
      $(".navbar-sticky .main-header-navbar").css({
        "background-color": "#ffff",
        "box-shadow": "-8px 12px 18px 0 rgba(25, 42, 70, 0.13)"
      })
      $(".navbar-static .main-header-navbar").css({
        "background-color": "transparent",
        "box-shadow": "none"
      })
    } else {
      $(".navbar-sticky .main-header-navbar").css({
        "background-color": "#f2f4f4",
        "box-shadow": "none"
      })
      $(".navbar-static .main-header-navbar").css({
        "background-color": "transparent",
        "box-shadow": "none"
      })
    }
  })

  var $scrollTop = $(window).scrollTop()
  if ($scrollTop > 20) {
    $(".dark-layout.navbar-sticky .main-header-navbar").css({
      "background-color": "#272e48",
      "box-shadow": "rgba(26, 35, 59, .70) -8px 12px 18px 0px"
    })
  }

  $(window).scroll(function () {
    if ($(this).scrollTop() > 20) {
      $(".dark-layout.navbar-sticky .main-header-navbar").css({
        "background-color": "#272e48",
        "box-shadow": "rgba(26, 35, 59, .70) -8px 12px 18px 0px"
      })
    } else {
      $(".dark-layout.navbar-sticky .main-header-navbar").css({
        "background-color": "transparent",
        "box-shadow": "none"
      })
    }
  })

  $(".header-navbar .dropdown-notification label").on("click", function (e) {
    e.stopPropagation()
  })
})(window, document, jQuery)
