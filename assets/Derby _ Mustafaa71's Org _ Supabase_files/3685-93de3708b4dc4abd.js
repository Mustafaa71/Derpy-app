"use strict";(self.webpackChunk_N_E=self.webpackChunk_N_E||[]).push([[3685],{66142:function(e,t,n){function r(e,t={}){let n=(t.align||[]).concat(),r=t.stringLength||i,u=[],o=[],a=[],c=[],s=0,f=-1;for(;++f<e.length;){let n=[],i=[],l=-1;for(e[f].length>s&&(s=e[f].length);++l<e[f].length;){var h;let u=null==(h=e[f][l])?"":String(h);if(!1!==t.alignDelimiters){let e=r(u);i[l]=e,(void 0===c[l]||e>c[l])&&(c[l]=e)}n.push(u)}o[f]=n,a[f]=i}let p=-1;if("object"==typeof n&&"length"in n)for(;++p<s;)u[p]=l(n[p]);else{let e=l(n);for(;++p<s;)u[p]=e}p=-1;let g=[],d=[];for(;++p<s;){let e=u[p],n="",r="";99===e?(n=":",r=":"):108===e?n=":":114===e&&(r=":");let i=!1===t.alignDelimiters?1:Math.max(1,c[p]-n.length-r.length),l=n+"-".repeat(i)+r;!1!==t.alignDelimiters&&((i=n.length+i+r.length)>c[p]&&(c[p]=i),d[p]=i),g[p]=l}o.splice(1,0,g),a.splice(1,0,d),f=-1;let m=[];for(;++f<o.length;){let e=o[f],n=a[f];p=-1;let r=[];for(;++p<s;){let i=e[p]||"",l="",o="";if(!1!==t.alignDelimiters){let e=c[p]-(n[p]||0),t=u[p];114===t?l=" ".repeat(e):99===t?e%2?(l=" ".repeat(e/2+.5),o=" ".repeat(e/2-.5)):o=l=" ".repeat(e/2):o=" ".repeat(e)}!1===t.delimiterStart||p||r.push("|"),!1!==t.padding&&!(!1===t.alignDelimiters&&""===i)&&(!1!==t.delimiterStart||p)&&r.push(" "),!1!==t.alignDelimiters&&r.push(l),r.push(i),!1!==t.alignDelimiters&&r.push(o),!1!==t.padding&&r.push(" "),(!1!==t.delimiterEnd||p!==s-1)&&r.push("|")}m.push(!1===t.delimiterEnd?r.join("").replace(/ +$/,""):r.join(""))}return m.join("\n")}function i(e){return e.length}function l(e){let t="string"==typeof e?e.codePointAt(0):0;return 67===t||99===t?99:76===t||108===t?108:82===t||114===t?114:0}n.d(t,{x:function(){return r}})},73685:function(e,t,n){n.d(t,{Z:function(){return eV}});var r=n(87842);let i=f(/[A-Za-z]/),l=f(/[\dA-Za-z]/);function u(e){return null!==e&&e<-2}function o(e){return null!==e&&(e<0||32===e)}function a(e){return -2===e||-1===e||32===e}f(/[#-'*+\--9=?A-Z^-~]/),f(/\d/),f(/[\dA-Fa-f]/),f(/[!-/:-@[-`{-~]/);let c=f(/[!-\/:-@\[-`\{-~\xA1\xA7\xAB\xB6\xB7\xBB\xBF\u037E\u0387\u055A-\u055F\u0589\u058A\u05BE\u05C0\u05C3\u05C6\u05F3\u05F4\u0609\u060A\u060C\u060D\u061B\u061D-\u061F\u066A-\u066D\u06D4\u0700-\u070D\u07F7-\u07F9\u0830-\u083E\u085E\u0964\u0965\u0970\u09FD\u0A76\u0AF0\u0C77\u0C84\u0DF4\u0E4F\u0E5A\u0E5B\u0F04-\u0F12\u0F14\u0F3A-\u0F3D\u0F85\u0FD0-\u0FD4\u0FD9\u0FDA\u104A-\u104F\u10FB\u1360-\u1368\u1400\u166E\u169B\u169C\u16EB-\u16ED\u1735\u1736\u17D4-\u17D6\u17D8-\u17DA\u1800-\u180A\u1944\u1945\u1A1E\u1A1F\u1AA0-\u1AA6\u1AA8-\u1AAD\u1B5A-\u1B60\u1B7D\u1B7E\u1BFC-\u1BFF\u1C3B-\u1C3F\u1C7E\u1C7F\u1CC0-\u1CC7\u1CD3\u2010-\u2027\u2030-\u2043\u2045-\u2051\u2053-\u205E\u207D\u207E\u208D\u208E\u2308-\u230B\u2329\u232A\u2768-\u2775\u27C5\u27C6\u27E6-\u27EF\u2983-\u2998\u29D8-\u29DB\u29FC\u29FD\u2CF9-\u2CFC\u2CFE\u2CFF\u2D70\u2E00-\u2E2E\u2E30-\u2E4F\u2E52-\u2E5D\u3001-\u3003\u3008-\u3011\u3014-\u301F\u3030\u303D\u30A0\u30FB\uA4FE\uA4FF\uA60D-\uA60F\uA673\uA67E\uA6F2-\uA6F7\uA874-\uA877\uA8CE\uA8CF\uA8F8-\uA8FA\uA8FC\uA92E\uA92F\uA95F\uA9C1-\uA9CD\uA9DE\uA9DF\uAA5C-\uAA5F\uAADE\uAADF\uAAF0\uAAF1\uABEB\uFD3E\uFD3F\uFE10-\uFE19\uFE30-\uFE52\uFE54-\uFE61\uFE63\uFE68\uFE6A\uFE6B\uFF01-\uFF03\uFF05-\uFF0A\uFF0C-\uFF0F\uFF1A\uFF1B\uFF1F\uFF20\uFF3B-\uFF3D\uFF3F\uFF5B\uFF5D\uFF5F-\uFF65]/),s=f(/\s/);function f(e){return function(t){return null!==t&&e.test(String.fromCharCode(t))}}let h={tokenize:function(e,t,n){let r=0;return function t(l){return(87===l||119===l)&&r<3?(r++,e.consume(l),t):46===l&&3===r?(e.consume(l),i):n(l)};function i(e){return null===e?n(e):t(e)}},partial:!0},p={tokenize:function(e,t,n){let r,i,l;return u;function u(t){return 46===t||95===t?e.check(d,f,a)(t):null===t||o(t)||s(t)||45!==t&&c(t)?f(t):(l=!0,e.consume(t),u)}function a(t){return 95===t?r=!0:(i=r,r=void 0),e.consume(t),u}function f(e){return i||r||!l?n(e):t(e)}},partial:!0},g={tokenize:function(e,t){let n=0,r=0;return i;function i(u){return 40===u?(n++,e.consume(u),i):41===u&&r<n?l(u):33===u||34===u||38===u||39===u||41===u||42===u||44===u||46===u||58===u||59===u||60===u||63===u||93===u||95===u||126===u?e.check(d,t,l)(u):null===u||o(u)||s(u)?t(u):(e.consume(u),i)}function l(t){return 41===t&&r++,e.consume(t),i}},partial:!0},d={tokenize:function(e,t,n){return r;function r(i){return 33===i||34===i||39===i||41===i||42===i||44===i||46===i||58===i||59===i||63===i||95===i||126===i?(e.consume(i),r):38===i?(e.consume(i),u):93===i?(e.consume(i),l):60===i||null===i||o(i)||s(i)?t(i):n(i)}function l(e){return null===e||40===e||91===e||o(e)||s(e)?t(e):r(e)}function u(t){return i(t)?function t(l){return 59===l?(e.consume(l),r):i(l)?(e.consume(l),t):n(l)}(t):n(t)}},partial:!0},m={tokenize:function(e,t,n){return function(t){return e.consume(t),r};function r(e){return l(e)?n(e):t(e)}},partial:!0},k={tokenize:function(e,t,n){let r=this;return function(t){return 87!==t&&119!==t||!A.call(r,r.previous)||w(r.events)?n(t):(e.enter("literalAutolink"),e.enter("literalAutolinkWww"),e.check(h,e.attempt(p,e.attempt(g,i),n),n)(t))};function i(n){return e.exit("literalAutolinkWww"),e.exit("literalAutolink"),t(n)}},previous:A},b={tokenize:function(e,t,n){let r=this,l="",u=!1;return function(t){return(72===t||104===t)&&D.call(r,r.previous)&&!w(r.events)?(e.enter("literalAutolink"),e.enter("literalAutolinkHttp"),l+=String.fromCodePoint(t),e.consume(t),a):n(t)};function a(t){if(i(t)&&l.length<5)return l+=String.fromCodePoint(t),e.consume(t),a;if(58===t){let n=l.toLowerCase();if("http"===n||"https"===n)return e.consume(t),f}return n(t)}function f(t){return 47===t?(e.consume(t),u)?h:(u=!0,f):n(t)}function h(t){return null===t||null!==t&&(t<32||127===t)||o(t)||s(t)||c(t)?n(t):e.attempt(p,e.attempt(g,d),n)(t)}function d(n){return e.exit("literalAutolinkHttp"),e.exit("literalAutolink"),t(n)}},previous:D},F={tokenize:function(e,t,n){let r,u;let o=this;return function(t){return!E(t)||!v.call(o,o.previous)||w(o.events)?n(t):(e.enter("literalAutolink"),e.enter("literalAutolinkEmail"),function t(r){return E(r)?(e.consume(r),t):64===r?(e.consume(r),a):n(r)}(t))};function a(t){return 46===t?e.check(m,s,c)(t):45===t||95===t||l(t)?(u=!0,e.consume(t),a):s(t)}function c(t){return e.consume(t),r=!0,a}function s(l){return u&&r&&i(o.previous)?(e.exit("literalAutolinkEmail"),e.exit("literalAutolink"),t(l)):n(l)}},previous:v},x={},y={text:x},C=48;for(;C<123;)x[C]=F,58==++C?C=65:91===C&&(C=97);function A(e){return null===e||40===e||42===e||95===e||91===e||93===e||126===e||o(e)}function D(e){return!i(e)}function v(e){return!(47===e||E(e))}function E(e){return 43===e||45===e||46===e||95===e||l(e)}function w(e){let t=e.length,n=!1;for(;t--;){let r=e[t][1];if(("labelLink"===r.type||"labelImage"===r.type)&&!r._balanced){n=!0;break}if(r._gfmAutolinkLiteralWalkedInto){n=!1;break}}return e.length>0&&!n&&(e[e.length-1][1]._gfmAutolinkLiteralWalkedInto=!0),n}x[43]=F,x[45]=F,x[46]=F,x[95]=F,x[72]=[F,b],x[104]=[F,b],x[87]=[F,k],x[119]=[F,k];var j=n(8466),L=n(54951),S=n(36910);let O={tokenize:function(e,t,n){let r=this;return(0,L.f)(e,function(e){let i=r.events[r.events.length-1];return i&&"gfmFootnoteDefinitionIndent"===i[1].type&&4===i[2].sliceSerialize(i[1],!0).length?t(e):n(e)},"gfmFootnoteDefinitionIndent",5)},partial:!0};function B(e,t,n){let r;let i=this,l=i.events.length,u=i.parser.gfmFootnotes||(i.parser.gfmFootnotes=[]);for(;l--;){let e=i.events[l][1];if("labelImage"===e.type){r=e;break}if("gfmFootnoteCall"===e.type||"labelLink"===e.type||"label"===e.type||"image"===e.type||"link"===e.type)break}return function(l){if(!r||!r._balanced)return n(l);let o=(0,S.d)(i.sliceSerialize({start:r.end,end:i.now()}));return 94===o.codePointAt(0)&&u.includes(o.slice(1))?(e.enter("gfmFootnoteCallLabelMarker"),e.consume(l),e.exit("gfmFootnoteCallLabelMarker"),t(l)):n(l)}}function M(e,t){let n=e.length;for(;n--;)if("labelImage"===e[n][1].type&&"enter"===e[n][0]){e[n][1];break}e[n+1][1].type="data",e[n+3][1].type="gfmFootnoteCallLabelMarker";let r={type:"gfmFootnoteCall",start:Object.assign({},e[n+3][1].start),end:Object.assign({},e[e.length-1][1].end)},i={type:"gfmFootnoteCallMarker",start:Object.assign({},e[n+3][1].end),end:Object.assign({},e[n+3][1].end)};i.end.column++,i.end.offset++,i.end._bufferIndex++;let l={type:"gfmFootnoteCallString",start:Object.assign({},i.end),end:Object.assign({},e[e.length-1][1].start)},u={type:"chunkString",contentType:"string",start:Object.assign({},l.start),end:Object.assign({},l.end)},o=[e[n+1],e[n+2],["enter",r,t],e[n+3],e[n+4],["enter",i,t],["exit",i,t],["enter",l,t],["enter",u,t],["exit",u,t],["exit",l,t],e[e.length-2],e[e.length-1],["exit",r,t]];return e.splice(n,e.length-n+1,...o),e}function z(e,t,n){let r;let i=this,l=i.parser.gfmFootnotes||(i.parser.gfmFootnotes=[]),u=0;return function(t){return e.enter("gfmFootnoteCall"),e.enter("gfmFootnoteCallLabelMarker"),e.consume(t),e.exit("gfmFootnoteCallLabelMarker"),a};function a(t){return 94!==t?n(t):(e.enter("gfmFootnoteCallMarker"),e.consume(t),e.exit("gfmFootnoteCallMarker"),e.enter("gfmFootnoteCallString"),e.enter("chunkString").contentType="string",c)}function c(a){if(u>999||93===a&&!r||null===a||91===a||o(a))return n(a);if(93===a){e.exit("chunkString");let r=e.exit("gfmFootnoteCallString");return l.includes((0,S.d)(i.sliceSerialize(r)))?(e.enter("gfmFootnoteCallLabelMarker"),e.consume(a),e.exit("gfmFootnoteCallLabelMarker"),e.exit("gfmFootnoteCall"),t):n(a)}return o(a)||(r=!0),u++,e.consume(a),92===a?s:c}function s(t){return 91===t||92===t||93===t?(e.consume(t),u++,c):c(t)}}function R(e,t,n){let r,i;let l=this,u=l.parser.gfmFootnotes||(l.parser.gfmFootnotes=[]),a=0;return function(t){return e.enter("gfmFootnoteDefinition")._container=!0,e.enter("gfmFootnoteDefinitionLabel"),e.enter("gfmFootnoteDefinitionLabelMarker"),e.consume(t),e.exit("gfmFootnoteDefinitionLabelMarker"),c};function c(t){return 94===t?(e.enter("gfmFootnoteDefinitionMarker"),e.consume(t),e.exit("gfmFootnoteDefinitionMarker"),e.enter("gfmFootnoteDefinitionLabelString"),e.enter("chunkString").contentType="string",s):n(t)}function s(t){if(a>999||93===t&&!i||null===t||91===t||o(t))return n(t);if(93===t){e.exit("chunkString");let n=e.exit("gfmFootnoteDefinitionLabelString");return r=(0,S.d)(l.sliceSerialize(n)),e.enter("gfmFootnoteDefinitionLabelMarker"),e.consume(t),e.exit("gfmFootnoteDefinitionLabelMarker"),e.exit("gfmFootnoteDefinitionLabel"),h}return o(t)||(i=!0),a++,e.consume(t),92===t?f:s}function f(t){return 91===t||92===t||93===t?(e.consume(t),a++,s):s(t)}function h(t){return 58===t?(e.enter("definitionMarker"),e.consume(t),e.exit("definitionMarker"),u.includes(r)||u.push(r),(0,L.f)(e,p,"gfmFootnoteDefinitionWhitespace")):n(t)}function p(e){return t(e)}}function T(e,t,n){return e.check(j.w,t,e.attempt(O,t,n))}function _(e){e.exit("gfmFootnoteDefinition")}var I=n(98391),H=n(93302),P=n(27828);class ${constructor(){this.map=[]}add(e,t,n){!function(e,t,n,r){let i=0;if(0!==n||0!==r.length){for(;i<e.map.length;){if(e.map[i][0]===t){e.map[i][1]+=n,e.map[i][2].push(...r);return}i+=1}e.map.push([t,n,r])}}(this,e,t,n)}consume(e){if(this.map.sort((e,t)=>e[0]-t[0]),0===this.map.length)return;let t=this.map.length,n=[];for(;t>0;)t-=1,n.push(e.slice(this.map[t][0]+this.map[t][1])),n.push(this.map[t][2]),e.length=this.map[t][0];n.push([...e]),e.length=0;let r=n.pop();for(;r;)e.push(...r),r=n.pop();this.map.length=0}}let W={flow:{null:{tokenize:function(e,t,n){let r;let i=this,l=0,c=0;return function(e){let t=i.events.length-1;for(;t>-1;){let e=i.events[t][1].type;if("lineEnding"===e||"linePrefix"===e)t--;else break}let r=t>-1?i.events[t][1].type:null,l="tableHead"===r||"tableRow"===r?y:s;return l===y&&i.parser.lazy[i.now().line]?n(e):l(e)};function s(t){return e.enter("tableHead"),e.enter("tableRow"),124===t||(r=!0,c+=1),f(t)}function f(t){return null===t?n(t):u(t)?c>1?(c=0,i.interrupt=!0,e.exit("tableRow"),e.enter("lineEnding"),e.consume(t),e.exit("lineEnding"),g):n(t):a(t)?(0,L.f)(e,f,"whitespace")(t):(c+=1,r&&(r=!1,l+=1),124===t)?(e.enter("tableCellDivider"),e.consume(t),e.exit("tableCellDivider"),r=!0,f):(e.enter("data"),h(t))}function h(t){return null===t||124===t||o(t)?(e.exit("data"),f(t)):(e.consume(t),92===t?p:h)}function p(t){return 92===t||124===t?(e.consume(t),h):h(t)}function g(t){return(i.interrupt=!1,i.parser.lazy[i.now().line])?n(t):(e.enter("tableDelimiterRow"),r=!1,a(t))?(0,L.f)(e,d,"linePrefix",i.parser.constructs.disable.null.includes("codeIndented")?void 0:4)(t):d(t)}function d(t){return 45===t||58===t?k(t):124===t?(r=!0,e.enter("tableCellDivider"),e.consume(t),e.exit("tableCellDivider"),m):n(t)}function m(t){return a(t)?(0,L.f)(e,k,"whitespace")(t):k(t)}function k(t){return 58===t?(c+=1,r=!0,e.enter("tableDelimiterMarker"),e.consume(t),e.exit("tableDelimiterMarker"),b):45===t?(c+=1,b(t)):null===t||u(t)?x(t):n(t)}function b(t){return 45===t?(e.enter("tableDelimiterFiller"),function t(n){return 45===n?(e.consume(n),t):58===n?(r=!0,e.exit("tableDelimiterFiller"),e.enter("tableDelimiterMarker"),e.consume(n),e.exit("tableDelimiterMarker"),F):(e.exit("tableDelimiterFiller"),F(n))}(t)):n(t)}function F(t){return a(t)?(0,L.f)(e,x,"whitespace")(t):x(t)}function x(i){return 124===i?d(i):null===i||u(i)?r&&l===c?(e.exit("tableDelimiterRow"),e.exit("tableHead"),t(i)):n(i):n(i)}function y(t){return e.enter("tableRow"),C(t)}function C(n){return 124===n?(e.enter("tableCellDivider"),e.consume(n),e.exit("tableCellDivider"),C):null===n||u(n)?(e.exit("tableRow"),t(n)):a(n)?(0,L.f)(e,C,"whitespace")(n):(e.enter("data"),A(n))}function A(t){return null===t||124===t||o(t)?(e.exit("data"),C(t)):(e.consume(t),92===t?D:A)}function D(t){return 92===t||124===t?(e.consume(t),A):A(t)}},resolveAll:function(e,t){let n,r,i,l=-1,u=!0,o=0,a=[0,0,0,0],c=[0,0,0,0],s=!1,f=0,h=new $;for(;++l<e.length;){let p=e[l],g=p[1];"enter"===p[0]?"tableHead"===g.type?(s=!1,0!==f&&(V(h,t,f,n,r),r=void 0,f=0),n={type:"table",start:Object.assign({},g.start),end:Object.assign({},g.end)},h.add(l,0,[["enter",n,t]])):"tableRow"===g.type||"tableDelimiterRow"===g.type?(u=!0,i=void 0,a=[0,0,0,0],c=[0,l+1,0,0],s&&(s=!1,r={type:"tableBody",start:Object.assign({},g.start),end:Object.assign({},g.end)},h.add(l,0,[["enter",r,t]])),o="tableDelimiterRow"===g.type?2:r?3:1):o&&("data"===g.type||"tableDelimiterMarker"===g.type||"tableDelimiterFiller"===g.type)?(u=!1,0===c[2]&&(0!==a[1]&&(c[0]=c[1],i=q(h,t,a,o,void 0,i),a=[0,0,0,0]),c[2]=l)):"tableCellDivider"===g.type&&(u?u=!1:(0!==a[1]&&(c[0]=c[1],i=q(h,t,a,o,void 0,i)),c=[(a=c)[1],l,0,0])):"tableHead"===g.type?(s=!0,f=l):"tableRow"===g.type||"tableDelimiterRow"===g.type?(f=l,0!==a[1]?(c[0]=c[1],i=q(h,t,a,o,l,i)):0!==c[1]&&(i=q(h,t,c,o,l,i)),o=0):o&&("data"===g.type||"tableDelimiterMarker"===g.type||"tableDelimiterFiller"===g.type)&&(c[3]=l)}for(0!==f&&V(h,t,f,n,r),h.consume(t.events),l=-1;++l<t.events.length;){let e=t.events[l];"enter"===e[0]&&"table"===e[1].type&&(e[1]._align=function(e,t){let n=!1,r=[];for(;t<e.length;){let i=e[t];if(n){if("enter"===i[0])"tableContent"===i[1].type&&r.push("tableDelimiterMarker"===e[t+1][1].type?"left":"none");else if("tableContent"===i[1].type){if("tableDelimiterMarker"===e[t-1][1].type){let e=r.length-1;r[e]="left"===r[e]?"center":"right"}}else if("tableDelimiterRow"===i[1].type)break}else"enter"===i[0]&&"tableDelimiterRow"===i[1].type&&(n=!0);t+=1}return r}(t.events,l))}return e}}}};function q(e,t,n,r,i,l){0!==n[0]&&(l.end=Object.assign({},Z(t.events,n[0])),e.add(n[0],0,[["exit",l,t]]));let u=Z(t.events,n[1]);if(l={type:1===r?"tableHeader":2===r?"tableDelimiter":"tableData",start:Object.assign({},u),end:Object.assign({},u)},e.add(n[1],0,[["enter",l,t]]),0!==n[2]){let i=Z(t.events,n[2]),l=Z(t.events,n[3]),u={type:"tableContent",start:Object.assign({},i),end:Object.assign({},l)};if(e.add(n[2],0,[["enter",u,t]]),2!==r){let r=t.events[n[2]],i=t.events[n[3]];if(r[1].end=Object.assign({},i[1].end),r[1].type="chunkText",r[1].contentType="text",n[3]>n[2]+1){let t=n[2]+1,r=n[3]-n[2]-1;e.add(t,r,[])}}e.add(n[3]+1,0,[["exit",u,t]])}return void 0!==i&&(l.end=Object.assign({},Z(t.events,i)),e.add(i,0,[["exit",l,t]]),l=void 0),l}function V(e,t,n,r,i){let l=[],u=Z(t.events,n);i&&(i.end=Object.assign({},u),l.push(["exit",i,t])),r.end=Object.assign({},u),l.push(["exit",r,t]),e.add(n+1,0,l)}function Z(e,t){let n=e[t],r="enter"===n[0]?"start":"end";return n[1][r]}let U={text:{91:{tokenize:function(e,t,n){let r=this;return function(t){return null===r.previous&&r._gfmTasklistFirstContentOfListItem?(e.enter("taskListCheck"),e.enter("taskListCheckMarker"),e.consume(t),e.exit("taskListCheckMarker"),i):n(t)};function i(t){return o(t)?(e.enter("taskListCheckValueUnchecked"),e.consume(t),e.exit("taskListCheckValueUnchecked"),l):88===t||120===t?(e.enter("taskListCheckValueChecked"),e.consume(t),e.exit("taskListCheckValueChecked"),l):n(t)}function l(t){return 93===t?(e.enter("taskListCheckMarker"),e.consume(t),e.exit("taskListCheckMarker"),e.exit("taskListCheck"),c):n(t)}function c(r){return u(r)?t(r):a(r)?e.check({tokenize:N},t,n)(r):n(r)}}}}};function N(e,t,n){return(0,L.f)(e,function(e){return null===e?n(e):t(e)},"whitespace")}function Q(e,t){let n=String(e);if("string"!=typeof t)throw TypeError("Expected character");let r=0,i=n.indexOf(t);for(;-1!==i;)r++,i=n.indexOf(t,i+t.length);return r}let G=function(e){if(null==e)return K;if("string"==typeof e)return J(function(t){return t&&t.type===e});if("object"==typeof e)return Array.isArray(e)?function(e){let t=[],n=-1;for(;++n<e.length;)t[n]=G(e[n]);return J(function(...e){let n=-1;for(;++n<t.length;)if(t[n].call(this,...e))return!0;return!1})}(e):J(function(t){let n;for(n in e)if(t[n]!==e[n])return!1;return!0});if("function"==typeof e)return J(e);throw Error("Expected function, string, or object as test")};function J(e){return function(t,...n){return!!(t&&"object"==typeof t&&"type"in t&&e.call(this,t,...n))}}function K(){return!0}let X=function(e,t,n,r){"function"==typeof t&&"function"!=typeof n&&(r=n,n=t,t=null);let i=G(t),l=r?-1:1;(function e(u,o,a){let c=u&&"object"==typeof u?u:{};if("string"==typeof c.type){let e="string"==typeof c.tagName?c.tagName:"string"==typeof c.name?c.name:void 0;Object.defineProperty(s,"name",{value:"node ("+u.type+(e?"<"+e+">":"")+")"})}return s;function s(){var c;let s,f,h,p=[];if((!t||i(u,o,a[a.length-1]||null))&&!1===(p=Array.isArray(c=n(u,a))?c:"number"==typeof c?[!0,c]:[c])[0])return p;if(u.children&&"skip"!==p[0])for(f=(r?u.children.length:-1)+l,h=a.concat(u);f>-1&&f<u.children.length;){if(!1===(s=e(u.children[f],f,h)())[0])return s;f="number"==typeof s[1]?s[1]:f+l}return p}})(e,void 0,[])()},Y={}.hasOwnProperty,ee=function(e,t,n,r){let i,l;"string"==typeof t||t instanceof RegExp?(l=[[t,n]],i=r):(l=t,i=n),i||(i={});let u=G(i.ignore||[]),o=function(e){let t=[];if("object"!=typeof e)throw TypeError("Expected array or object as schema");if(Array.isArray(e)){let n=-1;for(;++n<e.length;)t.push([et(e[n][0]),en(e[n][1])])}else{let n;for(n in e)Y.call(e,n)&&t.push([et(n),en(e[n])])}return t}(l),a=-1;for(;++a<o.length;)X(e,"text",c);return e;function c(e,t){let n,r=-1;for(;++r<t.length;){let e=t[r];if(u(e,n?n.children.indexOf(e):void 0,n))return;n=e}if(n)return function(e,t){let n=t[t.length-1],r=o[a][0],i=o[a][1],l=0,u=n.children.indexOf(e),c=!1,s=[];r.lastIndex=0;let f=r.exec(e.value);for(;f;){let n=f.index,u={index:f.index,input:f.input,stack:[...t,e]},o=i(...f,u);if("string"==typeof o&&(o=o.length>0?{type:"text",value:o}:void 0),!1!==o&&(l!==n&&s.push({type:"text",value:e.value.slice(l,n)}),Array.isArray(o)?s.push(...o):o&&s.push(o),l=n+f[0].length,c=!0),!r.global)break;f=r.exec(e.value)}return c?(l<e.value.length&&s.push({type:"text",value:e.value.slice(l)}),n.children.splice(u,1,...s)):s=[e],u+s.length}(e,t)}};function et(e){return"string"==typeof e?RegExp(function(e){if("string"!=typeof e)throw TypeError("Expected a string");return e.replace(/[|\\{}()[\]^$+*?.]/g,"\\$&").replace(/-/g,"\\x2d")}(e),"g"):e}function en(e){return"function"==typeof e?e:()=>e}let er="phrasing",ei=["autolink","link","image","label"],el={transforms:[function(e){ee(e,[[/(https?:\/\/|www(?=\.))([-.\w]+)([^ \t\r\n]*)/gi,ea],[/([-.\w+]+)@([-\w]+(?:\.[-\w]+)+)/g,ec]],{ignore:["link","linkReference"]})}],enter:{literalAutolink:function(e){this.enter({type:"link",title:null,url:"",children:[]},e)},literalAutolinkEmail:eo,literalAutolinkHttp:eo,literalAutolinkWww:eo},exit:{literalAutolink:function(e){this.exit(e)},literalAutolinkEmail:function(e){this.config.exit.autolinkEmail.call(this,e)},literalAutolinkHttp:function(e){this.config.exit.autolinkProtocol.call(this,e)},literalAutolinkWww:function(e){this.config.exit.data.call(this,e),this.stack[this.stack.length-1].url="http://"+this.sliceSerialize(e)}}},eu={unsafe:[{character:"@",before:"[+\\-.\\w]",after:"[\\-.\\w]",inConstruct:er,notInConstruct:ei},{character:".",before:"[Ww]",after:"[\\-.\\w]",inConstruct:er,notInConstruct:ei},{character:":",before:"[ps]",after:"\\/",inConstruct:er,notInConstruct:ei}]};function eo(e){this.config.enter.autolinkProtocol.call(this,e)}function ea(e,t,n,r,i){let l="";if(!es(i)||(/^w/i.test(t)&&(n=t+n,t="",l="http://"),!function(e){let t=e.split(".");return!(t.length<2||t[t.length-1]&&(/_/.test(t[t.length-1])||!/[a-zA-Z\d]/.test(t[t.length-1]))||t[t.length-2]&&(/_/.test(t[t.length-2])||!/[a-zA-Z\d]/.test(t[t.length-2])))}(n)))return!1;let u=function(e){let t=/[!"&'),.:;<>?\]}]+$/.exec(e);if(!t)return[e,void 0];e=e.slice(0,t.index);let n=t[0],r=n.indexOf(")"),i=Q(e,"("),l=Q(e,")");for(;-1!==r&&i>l;)e+=n.slice(0,r+1),r=(n=n.slice(r+1)).indexOf(")"),l++;return[e,n]}(n+r);if(!u[0])return!1;let o={type:"link",title:null,url:l+t+u[0],children:[{type:"text",value:t+u[0]}]};return u[1]?[o,{type:"text",value:u[1]}]:o}function ec(e,t,n,r){return!(!es(r,!0)||/[-\d_]$/.test(n))&&{type:"link",title:null,url:"mailto:"+t+"@"+n,children:[{type:"text",value:t+"@"+n}]}}function es(e,t){let n=e.input.charCodeAt(e.index-1);return(0===e.index||s(n)||c(n))&&(!t||47!==n)}var ef=n(12857);function eh(e){return e.label||!e.identifier?e.label||"":(0,ef.v)(e.identifier)}let ep=/\r?\n|\r/g;function eg(e){if(!e._compiled){let t=(e.atBreak?"[\\r\\n][\\t ]*":"")+(e.before?"(?:"+e.before+")":"");e._compiled=RegExp((t?"("+t+")":"")+(/[|\\{}()[\]^$+*?.-]/.test(e.character)?"\\":"")+e.character+(e.after?"(?:"+e.after+")":""),"g")}return e._compiled}function ed(e,t,n){if("string"==typeof t&&(t=[t]),!t||0===t.length)return n;let r=-1;for(;++r<t.length;)if(e.includes(t[r]))return!0;return!1}function em(e,t,n){let r=(n.before||"")+(t||"")+(n.after||""),i=[],l=[],u={},o=-1;for(;++o<e.unsafe.length;){var a;let t;let n=e.unsafe[o];if(!ed(a=e.stack,n.inConstruct,!0)||ed(a,n.notInConstruct,!1))continue;let l=eg(n);for(;t=l.exec(r);){let e="before"in n||!!n.atBreak,r="after"in n,l=t.index+(e?t[1].length:0);i.includes(l)?(u[l].before&&!e&&(u[l].before=!1),u[l].after&&!r&&(u[l].after=!1)):(i.push(l),u[l]={before:e,after:r})}}i.sort(ek);let c=n.before?n.before.length:0,s=r.length-(n.after?n.after.length:0);for(o=-1;++o<i.length;){let e=i[o];!(e<c)&&!(e>=s)&&(!(e+1<s)||i[o+1]!==e+1||!u[e].after||u[e+1].before||u[e+1].after)&&(i[o-1]!==e-1||!u[e].before||u[e-1].before||u[e-1].after)&&(c!==e&&l.push(eb(r.slice(c,e),"\\")),c=e,!/[!-/:-@[-`{-~]/.test(r.charAt(e))||n.encode&&n.encode.includes(r.charAt(e))?(l.push("&#x"+r.charCodeAt(e).toString(16).toUpperCase()+";"),c++):l.push("\\"))}return l.push(eb(r.slice(c,s),n.after)),l.join("")}function ek(e,t){return e-t}function eb(e,t){let n;let r=/\\(?=[!-/:-@[-`{-~])/g,i=[],l=[],u=e+t,o=-1,a=0;for(;n=r.exec(u);)i.push(n.index);for(;++o<i.length;)a!==i[o]&&l.push(e.slice(a,i[o])),l.push("\\"),a=i[o];return l.push(e.slice(a)),l.join("")}function eF(e){let t=e||{},n=t.now||{},r=t.lineShift||0,i=n.line||1,l=n.column||1;return{move:function(e){let t=e||"",n=t.split(/\r?\n|\r/g),u=n[n.length-1];return i+=n.length-1,l=1===n.length?l+u.length:1+u.length+r,t},current:function(){return{now:{line:i,column:l},lineShift:r}},shift:function(e){r+=e}}}function ex(e){this.enter({type:"footnoteDefinition",identifier:"",label:"",children:[]},e)}function ey(){this.buffer()}function eC(e){let t=this.resume(),n=this.stack[this.stack.length-1];n.label=t,n.identifier=(0,S.d)(this.sliceSerialize(e)).toLowerCase()}function eA(e){this.exit(e)}function eD(e){this.enter({type:"footnoteReference",identifier:"",label:""},e)}function ev(){this.buffer()}function eE(e){let t=this.resume(),n=this.stack[this.stack.length-1];n.label=t,n.identifier=(0,S.d)(this.sliceSerialize(e)).toLowerCase()}function ew(e){this.exit(e)}function ej(e,t,n,r){let i=eF(r),l=i.move("[^"),u=n.enter("footnoteReference"),o=n.enter("reference");return l+=i.move(em(n,eh(e),{...i.current(),before:l,after:"]"})),o(),u(),l+=i.move("]")}function eL(e,t,n,r){let i=eF(r),l=i.move("[^"),u=n.enter("footnoteDefinition"),o=n.enter("label");return l+=i.move(em(n,eh(e),{...i.current(),before:l,after:"]"})),o(),l+=i.move("]:"+(e.children&&e.children.length>0?" ":"")),i.shift(4),l+=i.move(function(e,t){let n;let r=[],i=0,l=0;for(;n=ep.exec(e);)u(e.slice(i,n.index)),r.push(n[0]),i=n.index+n[0].length,l++;return u(e.slice(i)),r.join("");function u(e){r.push(t(e,l,!e))}}(function(e,t,n){let r=t.indexStack,i=e.children||[],l=t.createTracker(n),u=[],o=-1;for(r.push(-1);++o<i.length;){let n=i[o];r[r.length-1]=o,u.push(l.move(t.handle(n,e,t,{before:"\n",after:"\n",...l.current()}))),"list"!==n.type&&(t.bulletLastUsed=void 0),o<i.length-1&&u.push(l.move(function(e,t,n,r){let i=r.join.length;for(;i--;){let l=r.join[i](e,t,n,r);if(!0===l||1===l)break;if("number"==typeof l)return"\n".repeat(1+l);if(!1===l)return"\n\n<!---->\n\n"}return"\n\n"}(n,i[o+1],e,t)))}return r.pop(),u.join("")}(e,n,i.current()),eS)),u(),l}function eS(e,t,n){return 0===t?e:(n?"":"    ")+e}function eO(e,t,n){let r=t.indexStack,i=e.children||[],l=[],u=-1,o=n.before;r.push(-1);let a=t.createTracker(n);for(;++u<i.length;){let c;let s=i[u];if(r[r.length-1]=u,u+1<i.length){let n=t.handle.handlers[i[u+1].type];n&&n.peek&&(n=n.peek),c=n?n(i[u+1],e,t,{before:"",after:"",...a.current()}).charAt(0):""}else c=n.after;l.length>0&&("\r"===o||"\n"===o)&&"html"===s.type&&(l[l.length-1]=l[l.length-1].replace(/(\r?\n|\r)$/," "),o=" ",(a=t.createTracker(n)).move(l.join(""))),l.push(a.move(t.handle(s,e,t,{...a.current(),before:o,after:c}))),o=l[l.length-1].slice(-1)}return r.pop(),l.join("")}ej.peek=function(){return"["},ez.peek=function(){return"~"};let eB={canContainEols:["delete"],enter:{strikethrough:function(e){this.enter({type:"delete",children:[]},e)}},exit:{strikethrough:function(e){this.exit(e)}}},eM={unsafe:[{character:"~",inConstruct:"phrasing",notInConstruct:["autolink","destinationLiteral","destinationRaw","reference","titleQuote","titleApostrophe"]}],handlers:{delete:ez}};function ez(e,t,n,r){let i=eF(r),l=n.enter("strikethrough"),u=i.move("~~");return u+=eO(e,n,{...i.current(),before:u,after:"~"})+i.move("~~"),l(),u}function eR(e,t,n){let r=e.value||"",i="`",l=-1;for(;RegExp("(^|[^`])"+i+"([^`]|$)").test(r);)i+="`";for(/[^ \r\n]/.test(r)&&(/^[ \r\n]/.test(r)&&/[ \r\n]$/.test(r)||/^`|`$/.test(r))&&(r=" "+r+" ");++l<n.unsafe.length;){let e;let t=n.unsafe[l],i=eg(t);if(t.atBreak)for(;e=i.exec(r);){let t=e.index;10===r.charCodeAt(t)&&13===r.charCodeAt(t-1)&&t--,r=r.slice(0,t)+" "+r.slice(e.index+1)}}return i+r+i}eR.peek=function(){return"`"};var eT=n(66142);let e_={enter:{table:function(e){let t=e._align;this.enter({type:"table",align:t.map(e=>"none"===e?null:e),children:[]},e),this.setData("inTable",!0)},tableData:eH,tableHeader:eH,tableRow:function(e){this.enter({type:"tableRow",children:[]},e)}},exit:{codeText:function(e){let t=this.resume();this.getData("inTable")&&(t=t.replace(/\\([\\|])/g,eP)),this.stack[this.stack.length-1].value=t,this.exit(e)},table:function(e){this.exit(e),this.setData("inTable")},tableData:eI,tableHeader:eI,tableRow:eI}};function eI(e){this.exit(e)}function eH(e){this.enter({type:"tableCell",children:[]},e)}function eP(e,t){return"|"===t?t:e}let e$={exit:{taskListCheckValueChecked:eq,taskListCheckValueUnchecked:eq,paragraph:function(e){let t=this.stack[this.stack.length-2];if(t&&"listItem"===t.type&&"boolean"==typeof t.checked){let e=this.stack[this.stack.length-1],n=e.children[0];if(n&&"text"===n.type){let r;let i=t.children,l=-1;for(;++l<i.length;){let e=i[l];if("paragraph"===e.type){r=e;break}}r===e&&(n.value=n.value.slice(1),0===n.value.length?e.children.shift():e.position&&n.position&&"number"==typeof n.position.start.offset&&(n.position.start.column++,n.position.start.offset++,e.position.start=Object.assign({},n.position.start)))}}this.exit(e)}}},eW={unsafe:[{atBreak:!0,character:"-",after:"[:|-]"}],handlers:{listItem:function(e,t,n,r){let i=e.children[0],l="boolean"==typeof e.checked&&i&&"paragraph"===i.type,u="["+(e.checked?"x":" ")+"] ",o=eF(r);l&&o.move(u);let a=function(e,t,n,r){let i=function(e){let t=e.options.listItemIndent||"tab";if(1===t||"1"===t)return"one";if("tab"!==t&&"one"!==t&&"mixed"!==t)throw Error("Cannot serialize items with `"+t+"` for `options.listItemIndent`, expected `tab`, `one`, or `mixed`");return t}(n),l=n.bulletCurrent||function(e){let t=e.options.bullet||"*";if("*"!==t&&"+"!==t&&"-"!==t)throw Error("Cannot serialize items with `"+t+"` for `options.bullet`, expected `*`, `+`, or `-`");return t}(n);t&&"list"===t.type&&t.ordered&&(l=("number"==typeof t.start&&t.start>-1?t.start:1)+(!1===n.options.incrementListMarker?0:t.children.indexOf(e))+l);let u=l.length+1;("tab"===i||"mixed"===i&&(t&&"list"===t.type&&t.spread||e.spread))&&(u=4*Math.ceil(u/4));let o=n.createTracker(r);o.move(l+" ".repeat(u-l.length)),o.shift(u);let a=n.enter("listItem"),c=n.indentLines(n.containerFlow(e,o.current()),function(e,t,n){return t?(n?"":" ".repeat(u))+e:(n?l:l+" ".repeat(u-l.length))+e});return a(),c}(e,t,n,{...r,...o.current()});return l&&(a=a.replace(/^(?:[*+-]|\d+\.)([\r\n]| {1,3})/,function(e){return e+u})),a}}};function eq(e){this.stack[this.stack.length-2].checked="taskListCheckValueChecked"===e.type}function eV(e={}){let t=this.data();function n(e,n){(t[e]?t[e]:t[e]=[]).push(n)}n("micromarkExtensions",(0,r.W)([y,{document:{91:{tokenize:R,continuation:{tokenize:T},exit:_}},text:{91:{tokenize:z},93:{add:"after",tokenize:B,resolveTo:M}}},function(e){let t=(e||{}).singleTilde,n={tokenize:function(e,n,r){let i=this.previous,l=this.events,u=0;return function(o){return 126===i&&"characterEscape"!==l[l.length-1][1].type?r(o):(e.enter("strikethroughSequenceTemporary"),function l(o){let a=(0,H.r)(i);if(126===o)return u>1?r(o):(e.consume(o),u++,l);if(u<2&&!t)return r(o);let c=e.exit("strikethroughSequenceTemporary"),s=(0,H.r)(o);return c._open=!s||2===s&&!!a,c._close=!a||2===a&&!!s,n(o)}(o))}},resolveAll:function(e,t){let n=-1;for(;++n<e.length;)if("enter"===e[n][0]&&"strikethroughSequenceTemporary"===e[n][1].type&&e[n][1]._close){let r=n;for(;r--;)if("exit"===e[r][0]&&"strikethroughSequenceTemporary"===e[r][1].type&&e[r][1]._open&&e[n][1].end.offset-e[n][1].start.offset==e[r][1].end.offset-e[r][1].start.offset){e[n][1].type="strikethroughSequence",e[r][1].type="strikethroughSequence";let i={type:"strikethrough",start:Object.assign({},e[r][1].start),end:Object.assign({},e[n][1].end)},l={type:"strikethroughText",start:Object.assign({},e[r][1].end),end:Object.assign({},e[n][1].start)},u=[["enter",i,t],["enter",e[r][1],t],["exit",e[r][1],t],["enter",l,t]],o=t.parser.constructs.insideSpan.null;o&&(0,I.d)(u,u.length,0,(0,P.C)(o,e.slice(r+1,n),t)),(0,I.d)(u,u.length,0,[["exit",l,t],["enter",e[n][1],t],["exit",e[n][1],t],["exit",i,t]]),(0,I.d)(e,r-1,n-r+3,u),n=r+u.length-2;break}}for(n=-1;++n<e.length;)"strikethroughSequenceTemporary"===e[n][1].type&&(e[n][1].type="data");return e}};return null==t&&(t=!0),{text:{126:n},insideSpan:{null:[n]},attentionMarkers:{null:[126]}}}(e),W,U])),n("fromMarkdownExtensions",[el,{enter:{gfmFootnoteDefinition:ex,gfmFootnoteDefinitionLabelString:ey,gfmFootnoteCall:eD,gfmFootnoteCallString:ev},exit:{gfmFootnoteDefinition:eA,gfmFootnoteDefinitionLabelString:eC,gfmFootnoteCall:ew,gfmFootnoteCallString:eE}},eB,e_,e$]),n("toMarkdownExtensions",{extensions:[eu,{unsafe:[{character:"[",inConstruct:["phrasing","label","reference"]}],handlers:{footnoteDefinition:eL,footnoteReference:ej}},eM,function(e){let t=e||{},n=t.tableCellPadding,r=t.tablePipeAlign,i=t.stringLength,l=n?" ":"|";return{unsafe:[{character:"\r",inConstruct:"tableCell"},{character:"\n",inConstruct:"tableCell"},{atBreak:!0,character:"|",after:"[	 :-]"},{character:"|",inConstruct:"tableCell"},{atBreak:!0,character:":",after:"-"},{atBreak:!0,character:"-",after:"[:|-]"}],handlers:{table:function(e,t,n,r){return o(function(e,t,n){let r=e.children,i=-1,l=[],u=t.enter("table");for(;++i<r.length;)l[i]=a(r[i],t,n);return u(),l}(e,n,r),e.align)},tableRow:function(e,t,n,r){let i=o([a(e,n,r)]);return i.slice(0,i.indexOf("\n"))},tableCell:u,inlineCode:function(e,t,n){let r=eR(e,t,n);return n.stack.includes("tableCell")&&(r=r.replace(/\|/g,"\\$&")),r}}};function u(e,t,n,r){let i=n.enter("tableCell"),u=n.enter("phrasing"),o=eO(e,n,{...r,before:l,after:l});return u(),i(),o}function o(e,t){return(0,eT.x)(e,{align:t,alignDelimiters:r,padding:n,stringLength:i})}function a(e,t,n){let r=e.children,i=-1,l=[],o=t.enter("tableRow");for(;++i<r.length;)l[i]=u(r[i],e,t,n);return o(),l}}(e),eW]})}}}]);