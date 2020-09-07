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
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/validation.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/validation.js":
/*!********************************************!*\
  !*** ./app/javascript/packs/validation.js ***!
  \********************************************/
/*! no static exports found */
/***/ (function(module, exports) {

throw new Error("Module build failed (from ./node_modules/babel-loader/lib/index.js):\nSyntaxError: /home/ducphu/NUS Internship/NUSTech/finalapp/app/javascript/packs/validation.js: Unexpected token, expected \",\" (5:11)\n\n  3 |   $(\"#form\").validate({\n  4 |     rules: {\n> 5 |       album[title]: \"required\"\n    |            ^\n  6 |     },\n  7 |     messages: {\n  8 |       album[title]: \"please enter new title\"\n    at Parser._raise (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:764:17)\n    at Parser.raiseWithData (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:757:17)\n    at Parser.raise (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:751:17)\n    at Parser.unexpected (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:8927:16)\n    at Parser.expect (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:8913:28)\n    at Parser.parseObjectLike (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:10600:14)\n    at Parser.parseExprAtom (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:10143:23)\n    at Parser.parseExprSubscripts (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:9789:23)\n    at Parser.parseUpdate (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:9769:21)\n    at Parser.parseMaybeUnary (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:9758:17)\n    at Parser.parseExprOps (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:9628:23)\n    at Parser.parseMaybeConditional (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:9602:23)\n    at Parser.parseMaybeAssign (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:9565:21)\n    at Parser.parseObjectProperty (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:10760:101)\n    at Parser.parseObjPropValue (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:10785:100)\n    at Parser.parsePropertyDefinition (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:10716:10)\n    at Parser.parseObjectLike (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:10609:25)\n    at Parser.parseExprAtom (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:10143:23)\n    at Parser.parseExprSubscripts (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:9789:23)\n    at Parser.parseUpdate (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:9769:21)\n    at Parser.parseMaybeUnary (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:9758:17)\n    at Parser.parseExprOps (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:9628:23)\n    at Parser.parseMaybeConditional (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:9602:23)\n    at Parser.parseMaybeAssign (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:9565:21)\n    at Parser.parseExprListItem (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:10989:18)\n    at Parser.parseCallExpressionArguments (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:9998:22)\n    at Parser.parseCoverCallAndAsyncArrowHead (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:9905:29)\n    at Parser.parseSubscript (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:9841:19)\n    at Parser.parseSubscripts (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:9812:19)\n    at Parser.parseExprSubscripts (/home/ducphu/NUS Internship/NUSTech/finalapp/node_modules/@babel/parser/lib/index.js:9795:17)");

/***/ })

/******/ });
//# sourceMappingURL=validation-addd33da8198cdc5e9c3.js.map