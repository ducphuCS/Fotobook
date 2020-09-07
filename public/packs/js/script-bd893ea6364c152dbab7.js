/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/script.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/script.js":
/*!****************************************!*\
  !*** ./app/javascript/packs/script.js ***!
  \****************************************/
/*! no static exports found */
/***/ (function(module, exports) {

$(document).ready(function () {
  var btnPhoto = $("#btn-photo");
  var btnAlbum = $("#btn-album");
  btnPhoto.on({
    "click": function click() {
      if (!btnPhoto.hasClass("chosen")) {
        btnPhoto.addClass("chosen");
        btnAlbum.removeClass("chosen");
      }
    }
  });
  btnAlbum.on({
    "click": function click() {
      if (!btnAlbum.hasClass("chosen")) {
        btnAlbum.addClass("chosen");
        btnPhoto.removeClass("chosen");
        btnAlbum.removeClass("bg-white");
      }
    }
  });
  $(".love").on({
    "click": function click() {
      var icon = $(this).children("svg");
      var fill_color = icon.attr("fill");

      if (fill_color == "rgb(60, 90, 154)") {
        $(icon).attr("fill", "lightgrey");
        $(this).children("span").text(parseInt($(this).children("span").text()) - 1);
      } else {
        $(icon).attr("fill", "rgb(60, 90, 154)");
        $(this).children("span").text(parseInt($(this).children("span").text()) + 1);
      }
    }
  });
  $("img").on({
    "click": function click() {
      var title = $(this).parent().parent().find("div[name='title-post']").html();
      var source = $(this).attr("src");
      var description = $(this).parent().parent().find("div[name='description-post']").html();

      if ($("#btn-photo").hasClass("chosen")) {
        $("#modal-photo-title").html(title);
        $("#modal-photo-body").attr("src", source);
        $("#modal-photo-description").html(description);
        $("#modal-photo").modal('toggle');
      } else {
        $("#modal-album-title").html(title);
        $("#modal-album-description").html(description); // this is for source of picture in album

        $("#modal-album").modal('toggle');
      }
    }
  });
  $(".photo-modal-close").on({
    "click": function click() {
      $("#modal-photo").toggle();
    }
  });
  $(".album-modal-close").on({
    "click": function click() {
      $("#modal-album").toggle();
    }
  });
  $(".carousel-control-prev").on({
    "click": function click() {
      var inner = $(".carousel-inner");
      var noCarousel = inner.find('.carousel-item').length;
      var active = inner.find('.carousel-item.active');

      if (active.is(':first-child')) {
        active.removeClass("active");
        inner.children().last().addClass("active");
      } else {
        active.prev().addClass("active");
        active.removeClass("active");
      }
    }
  });
  $(".carousel-control-next").on({
    "click": function click() {
      var inner = $(".carousel-inner");
      var noCarousel = inner.find('.carousel-item').length;
      var active = inner.find('.carousel-item.active');

      if (active.is(':last-child')) {
        active.removeClass("active");
        inner.children().first().addClass("active");
      } else {
        active.next().addClass("active");
        active.removeClass("active");
      }
    }
  });
  $("button[name='follow']").on({
    "click": function click() {
      if ($(this).hasClass("followed")) {
        $(this).removeClass("followed");
        $(this).addClass("follow");
        $(this).html("follow");
      } else {
        $(this).removeClass("follow");
        $(this).addClass("followed");
        $(this).html("following");
      }
    }
  });
  $(".tab").on({
    "click": function click() {
      var others = $(".tab").not(this);
      setAllTabOff();
      $(this).removeClass("text-secondary");
      $(this).addClass("text-color");
      var tabName = $(this).attr("name") + "-tab";
      $("div[name=" + tabName + "]").removeClass("d-none"); // $("div[name=tabName]").addClass("d-block")

      others.map(function () {
        $(this).removeClass("text-color");
        $(this).addClass("text-secondary");
      });
    }
  });
});

function setAllTabOff() {
  $("div[name='photos-tab']").addClass("d-none");
  $("div[name='albums-tab']").addClass("d-none");
  $("div[name='followings-tab']").addClass("d-none");
  $("div[name='followers-tab']").addClass("d-none");
}

/***/ })

/******/ });
//# sourceMappingURL=script-bd893ea6364c152dbab7.js.map