// editorjs-alert@1.1.4 downloaded from https://ga.jspm.io/npm:editorjs-alert@1.1.4/dist/bundle.js

var t=typeof globalThis!=="undefined"?globalThis:typeof self!=="undefined"?self:global;var a={};!function(t,i){a=i()}(self,(()=>(()=>{var a={800:(t,a,i)=>{i.d(a,{Z:()=>d});var c=i(81),l=i.n(c),s=i(645),p=i.n(s)()(l());p.push([t.id,".cdx-alert{position:relative;padding:10px;border-radius:5px;margin-bottom:10px}.cdx-alert-primary{background-color:#ebf8ff;border:1px solid #4299e1;color:#2b6cb0}.cdx-alert-secondary{background-color:#f7fafc;border:1px solid #cbd5e0;color:#222731}.cdx-alert-info{background-color:#e6fdff;border:1px solid #4cd4ce;color:#00727c}.cdx-alert-success{background-color:#f0fff4;border:1px solid #68d391;color:#2f855a}.cdx-alert-warning{background-color:#fffaf0;border:1px solid #ed8936;color:#c05621}.cdx-alert-danger{background-color:#fff5f5;border:1px solid #fc8181;color:#c53030}.cdx-alert-light{background-color:#fff;border:1px solid #edf2f7;color:#1a202c}.cdx-alert-dark{background-color:#2d3748;border:1px solid #1a202c;color:#d3d3d3}.cdx-alert-align-left{text-align:left}.cdx-alert-align-center{text-align:center}.cdx-alert-align-right{text-align:right}.cdx-alert__message{outline:none}.cdx-alert [contentEditable=true][data-placeholder]::before{position:absolute;content:attr(data-placeholder);color:#707684;font-weight:normal;opacity:0}.cdx-alert [contentEditable=true][data-placeholder]:empty::before{opacity:1}.cdx-alert [contentEditable=true][data-placeholder]:empty:focus::before{opacity:0}.ce-popover__item[data-item-name=alert-primary] .ce-popover__item-icon svg #background{fill:#ebf8ff;stroke:#4299e1}.ce-popover__item[data-item-name=alert-primary] .ce-popover__item-icon svg #content{fill:#2b6cb0}.ce-popover__item[data-item-name=alert-secondary] .ce-popover__item-icon svg #background{fill:#f7fafc;stroke:#cbd5e0}.ce-popover__item[data-item-name=alert-secondary] .ce-popover__item-icon svg #content{fill:#222731}.ce-popover__item[data-item-name=alert-info] .ce-popover__item-icon svg #background{fill:#e6fdff;stroke:#4cd4ce}.ce-popover__item[data-item-name=alert-info] .ce-popover__item-icon svg #content{fill:#00727c}.ce-popover__item[data-item-name=alert-success] .ce-popover__item-icon svg #background{fill:#f0fff4;stroke:#68d391}.ce-popover__item[data-item-name=alert-success] .ce-popover__item-icon svg #content{fill:#2f855a}.ce-popover__item[data-item-name=alert-warning] .ce-popover__item-icon svg #background{fill:#fffaf0;stroke:#ed8936}.ce-popover__item[data-item-name=alert-warning] .ce-popover__item-icon svg #content{fill:#c05621}.ce-popover__item[data-item-name=alert-danger] .ce-popover__item-icon svg #background{fill:#fff5f5;stroke:#fc8181}.ce-popover__item[data-item-name=alert-danger] .ce-popover__item-icon svg #content{fill:#c53030}.ce-popover__item[data-item-name=alert-light] .ce-popover__item-icon svg #background{fill:#fff;stroke:#edf2f7}.ce-popover__item[data-item-name=alert-light] .ce-popover__item-icon svg #content{fill:#1a202c}.ce-popover__item[data-item-name=alert-dark] .ce-popover__item-icon svg #background{fill:#2d3748;stroke:#1a202c}.ce-popover__item[data-item-name=alert-dark] .ce-popover__item-icon svg #content{fill:#d3d3d3}",""]);const d=p},645:a=>{a.exports=function(a){var i=[];return i.toString=function(){return this.map((function(t){var i="",c=void 0!==t[5];return t[4]&&(i+="@supports (".concat(t[4],") {")),t[2]&&(i+="@media ".concat(t[2]," {")),c&&(i+="@layer".concat(t[5].length>0?" ".concat(t[5]):""," {")),i+=a(t),c&&(i+="}"),t[2]&&(i+="}"),t[4]&&(i+="}"),i})).join("")},i.i=function(a,c,l,s,p){"string"==typeof a&&(a=[[null,a,void 0]]);var d={};if(l)for(var _=0;_<(this||t).length;_++){var k=(this||t)[_][0];null!=k&&(d[k]=!0)}for(var w=0;w<a.length;w++){var x=[].concat(a[w]);l&&d[x[0]]||(void 0!==p&&(void 0===x[5]||(x[1]="@layer".concat(x[5].length>0?" ".concat(x[5]):""," {").concat(x[1],"}")),x[5]=p),c&&(x[2]?(x[1]="@media ".concat(x[2]," {").concat(x[1],"}"),x[2]=c):x[2]=c),s&&(x[4]?(x[1]="@supports (".concat(x[4],") {").concat(x[1],"}"),x[4]=s):x[4]="".concat(s)),i.push(x))}},i}},81:t=>{t.exports=function(t){return t[1]}},620:(t,a,i)=>{var c=i(379),l=i.n(c),s=i(795),p=i.n(s),d=i(569),_=i.n(d),k=i(565),w=i.n(k),x=i(216),T=i.n(x),A=i(589),S=i.n(A),E=i(800),L={};L.styleTagTransform=S(),L.setAttributes=w(),L.insert=_().bind(null,"head"),L.domAPI=p(),L.insertStyleElement=T(),l()(E.Z,L),E.Z&&E.Z.locals&&E.Z.locals},379:t=>{var a=[];function r(t){for(var i=-1,c=0;c<a.length;c++)if(a[c].identifier===t){i=c;break}return i}function n(t,i){for(var c={},l=[],s=0;s<t.length;s++){var p=t[s],d=i.base?p[0]+i.base:p[0],_=c[d]||0,k="".concat(d," ").concat(_);c[d]=_+1;var w=r(k),x={css:p[1],media:p[2],sourceMap:p[3],supports:p[4],layer:p[5]};if(-1!==w)a[w].references++,a[w].updater(x);else{var T=o(x,i);i.byIndex=s,a.splice(s,0,{identifier:k,updater:T,references:1})}l.push(k)}return l}function o(t,a){var i=a.domAPI(a);return i.update(t),function(a){if(a){if(a.css===t.css&&a.media===t.media&&a.sourceMap===t.sourceMap&&a.supports===t.supports&&a.layer===t.layer)return;i.update(t=a)}else i.remove()}}t.exports=function(t,i){var c=n(t=t||[],i=i||{});return function(t){t=t||[];for(var l=0;l<c.length;l++){var s=r(c[l]);a[s].references--}for(var p=n(t,i),d=0;d<c.length;d++){var _=r(c[d]);0===a[_].references&&(a[_].updater(),a.splice(_,1))}c=p}}},569:t=>{var a={};t.exports=function(t,i){var c=function(t){if(void 0===a[t]){var i=document.querySelector(t);if(window.HTMLIFrameElement&&i instanceof window.HTMLIFrameElement)try{i=i.contentDocument.head}catch(t){i=null}a[t]=i}return a[t]}(t);if(!c)throw new Error("Couldn't find a style target. This probably means that the value for the 'insert' parameter is invalid.");c.appendChild(i)}},216:t=>{t.exports=function(t){var a=document.createElement("style");return t.setAttributes(a,t.attributes),t.insert(a,t.options),a}},565:(t,a,i)=>{t.exports=function(t){var a=i.nc;a&&t.setAttribute("nonce",a)}},795:t=>{t.exports=function(t){if("undefined"==typeof document)return{update:function(){},remove:function(){}};var a=t.insertStyleElement(t);return{update:function(i){!function(t,a,i){var c="";i.supports&&(c+="@supports (".concat(i.supports,") {")),i.media&&(c+="@media ".concat(i.media," {"));var l=void 0!==i.layer;l&&(c+="@layer".concat(i.layer.length>0?" ".concat(i.layer):""," {")),c+=i.css,l&&(c+="}"),i.media&&(c+="}"),i.supports&&(c+="}");var s=i.sourceMap;s&&"undefined"!=typeof btoa&&(c+="\n/*# sourceMappingURL=data:application/json;base64,".concat(btoa(unescape(encodeURIComponent(JSON.stringify(s))))," */")),a.styleTagTransform(c,t,a.options)}(a,t,i)},remove:function(){!function(t){if(null===t.parentNode)return!1;t.parentNode.removeChild(t)}(a)}}}},589:t=>{t.exports=function(t,a){if(a.styleSheet)a.styleSheet.cssText=t;else{for(;a.firstChild;)a.removeChild(a.firstChild);a.appendChild(document.createTextNode(t))}}},749:t=>{t.exports='<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M18 7L6 7"></path><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M18 17H6"></path><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M16 12L8 12"></path></svg>'},454:t=>{t.exports='<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M17 7L5 7"></path><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M17 17H5"></path><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M13 12L5 12"></path></svg>'},431:t=>{t.exports='<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M19 7L7 7"></path><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M19 17H7"></path><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M19 12L11 12"></path></svg>'},654:t=>{t.exports='<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><path stroke="currentColor" stroke-linecap="round" stroke-width="2" d="M5 12a7 7 90 0 1 14 0 7 7 90 0 1-14 0zM12 9.02v-.01M12 12v3"></path></svg>'},338:t=>{t.exports='<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><rect id="background" width="18" height="18" x="3" y="3" fill="none" stroke="currentColor" stroke-width="1" rx="4"></rect><path id="content" fill="currentColor" stroke-width="0" d="m15.579 16.9-1.042-2.25H10.15L9.11 16.9H7.113L11.697 7h1.266l4.612 9.9h-1.998Zm-4.613-4.05h2.755l-1.377-2.953-1.379 2.953Z"></path></svg>'}},i={};function r(t){var c=i[t];if(void 0!==c)return c.exports;var l=i[t]={id:t,exports:{}};return a[t](l,l.exports,r),l.exports}r.n=t=>{var a=t&&t.__esModule?()=>t.default:()=>t;return r.d(a,{a:a}),a},r.d=(t,a)=>{for(var i in a)r.o(a,i)&&!r.o(t,i)&&Object.defineProperty(t,i,{enumerable:!0,get:a[i]})},r.o=(t,a)=>Object.prototype.hasOwnProperty.call(t,a),r.nc=void 0;var c={};return(()=>{r.d(c,{default:()=>T});var a=r(654),i=r.n(a),l=r(338),s=r.n(l),p=r(454),d=r.n(p),_=r(749),k=r.n(_),w=r(431),x=r.n(w);function u(t){return u="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},u(t)}function f(t,a){var i=Object.keys(t);if(Object.getOwnPropertySymbols){var c=Object.getOwnPropertySymbols(t);a&&(c=c.filter((function(a){return Object.getOwnPropertyDescriptor(t,a).enumerable}))),i.push.apply(i,c)}return i}function g(t){for(var a=1;a<arguments.length;a++){var i=null!=arguments[a]?arguments[a]:{};a%2?f(Object(i),!0).forEach((function(a){m(t,a,i[a])})):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(i)):f(Object(i)).forEach((function(a){Object.defineProperty(t,a,Object.getOwnPropertyDescriptor(i,a))}))}return t}function m(t,a,i){return(a=b(a))in t?Object.defineProperty(t,a,{value:i,enumerable:!0,configurable:!0,writable:!0}):t[a]=i,t}function v(t){return function(t){if(Array.isArray(t))return h(t)}(t)||function(t){if("undefined"!=typeof Symbol&&null!=t[Symbol.iterator]||null!=t["@@iterator"])return Array.from(t)}(t)||function(t,a){if(t){if("string"==typeof t)return h(t,a);var i=Object.prototype.toString.call(t).slice(8,-1);return"Object"===i&&t.constructor&&(i=t.constructor.name),"Map"===i||"Set"===i?Array.from(t):"Arguments"===i||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(i)?h(t,a):void 0}}(t)||function(){throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}function h(t,a){(null==a||a>t.length)&&(a=t.length);for(var i=0,c=new Array(a);i<a;i++)c[i]=t[i];return c}function y(t,a){for(var i=0;i<a.length;i++){var c=a[i];c.enumerable=c.enumerable||!1,c.configurable=!0,"value"in c&&(c.writable=!0),Object.defineProperty(t,b(c.key),c)}}function b(t){var a=function(t,a){if("object"!==u(t)||null===t)return t;var i=t[Symbol.toPrimitive];if(void 0!==i){var c=i.call(t,"string");if("object"!==u(c))return c;throw new TypeError("@@toPrimitive must return a primitive value.")}return String(t)}(t);return"symbol"===u(a)?a:String(a)}r(620).toString();var T=function(){function e(a){var i=a.data,c=a.config,l=a.api,s=a.readOnly;!function(t,a){if(!(t instanceof a))throw new TypeError("Cannot call a class as a function")}(this||t,e),(this||t).api=l,(this||t).alertTypes=c.alertTypes||e.ALERT_TYPES,(this||t).defaultType=c.defaultType||e.DEFAULT_TYPE,(this||t).defaultAlign=c.defaultAlign||e.DEFAULT_ALIGN_TYPE,(this||t).messagePlaceholder=c.messagePlaceholder||e.DEFAULT_MESSAGE_PLACEHOLDER,(this||t).data={type:(this||t).alertTypes.includes(i.type)?i.type:(this||t).defaultType,align:e.ALIGN_TYPES.includes(i.align)?i.align:(this||t).defaultAlign,message:i.message||""},(this||t).container=void 0,(this||t).readOnly=s}var a,c,l;return a=e,c=[{key:"CSS",get:function(){return{wrapper:"cdx-alert",wrapperForType:function(t){return"cdx-alert-".concat(t)},wrapperForAlignType:function(t){return"cdx-alert-align-".concat(t)},message:"cdx-alert__message"}}},{key:"render",value:function(){var a=[(this||t).CSS.wrapper,(this||t).CSS.wrapperForType((this||t).data.type),(this||t).CSS.wrapperForAlignType((this||t).data.align)];(this||t).container=this._make("div",a);var i=this._make("div",[(this||t).CSS.message],{contentEditable:!(this||t).readOnly,innerHTML:(this||t).data.message});return i.dataset.placeholder=(this||t).messagePlaceholder,(this||t).container.appendChild(i),(this||t).container}},{key:"renderSettings",value:function(){var a=this||t,i=(this||t).alertTypes.map((function(t){return{icon:s(),name:"alert-".concat(t),label:a._getFormattedName(t),toggle:"alert",isActive:a.data.type===t,onActivate:function(){a._changeAlertType(t)}}})),c=e.ALIGN_TYPES.map((function(t){return{icon:"left"==t?d():"center"==t?k():"right"==t?x():IconAlign_left,name:"align-".concat(t),label:a._getFormattedName(t),toggle:"align",isActive:a.data.align===t,onActivate:function(){a._changeAlignType(t)}}}));return[].concat(v(i),v(c))}},{key:"_getFormattedName",value:function(a){return(this||t).api.i18n.t(a.charAt(0).toUpperCase()+a.slice(1))}},{key:"_changeAlertType",value:function(a){var i=this||t;(this||t).data.type=a,(this||t).alertTypes.forEach((function(t){var c=i.CSS.wrapperForType(t);i.container.classList.remove(c),a===t&&i.container.classList.add(c)}))}},{key:"_changeAlignType",value:function(a){var i=this||t;(this||t).data.align=a,e.ALIGN_TYPES.forEach((function(t){var c=i.CSS.wrapperForAlignType(t);i.container.classList.remove(c),a===t&&i.container.classList.add(c)}))}},{key:"save",value:function(a){var i=a.querySelector(".".concat((this||t).CSS.message));return g(g({},(this||t).data),{},{message:i.innerHTML})}},{key:"_make",value:function(t){var a,i=arguments.length>1&&void 0!==arguments[1]?arguments[1]:null,c=arguments.length>2&&void 0!==arguments[2]?arguments[2]:{},l=document.createElement(t);for(var s in Array.isArray(i)?(a=l.classList).add.apply(a,v(i)):i&&l.classList.add(i),c)l[s]=c[s];return l}},{key:"onPaste",value:function(a){var i=a.detail.data;(this||t).data={type:(this||t).defaultType,message:i.innerHTML||""}}}],l=[{key:"toolbox",get:function(){return{icon:i(),title:"Alert"}}},{key:"enableLineBreaks",get:function(){return!0}},{key:"DEFAULT_TYPE",get:function(){return"info"}},{key:"DEFAULT_ALIGN_TYPE",get:function(){return"left"}},{key:"DEFAULT_MESSAGE_PLACEHOLDER",get:function(){return"Type here..."}},{key:"ALERT_TYPES",get:function(){return["primary","secondary","info","success","warning","danger","light","dark"]}},{key:"ALIGN_TYPES",get:function(){return["left","center","right"]}},{key:"isReadOnlySupported",get:function(){return!0}},{key:"conversionConfig",get:function(){var a=this||t;return{export:function(t){return t.message},import:function(t){return{message:t,type:a.DEFAULT_TYPE,alignType:a.DEFAULT_ALIGN_TYPE}}}}},{key:"sanitize",get:function(){return{message:!0,type:!1,alignType:!1}}}],c&&y(a.prototype,c),l&&y(a,l),Object.defineProperty(a,"prototype",{writable:!1}),e}()})(),c.default})()));var i=a;const c=a.Alert;export{c as Alert,i as default};

