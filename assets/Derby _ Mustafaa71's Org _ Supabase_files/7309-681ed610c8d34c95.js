(self.webpackChunk_N_E=self.webpackChunk_N_E||[]).push([[7309],{94896:function(e,t,n){"use strict";n.d(t,{U:function(){return i}});let i={orgSubscription:e=>["organizations",e,"subscription"],orgPlans:e=>["organizations",e,"plans"],addons:e=>["projects",e,"addons"]}},93463:function(e,t,n){"use strict";n.d(t,{G:function(){return o}});var i=n(36492),r=n(31696),a=n(94896);async function s(e,t){let{orgSlug:n}=e;if(!n)throw Error("orgSlug is required");let{error:i,data:a}=await (0,r.U2)("/platform/organizations/{slug}/billing/subscription",{params:{path:{slug:n}},signal:t});if(i)throw i;return a}let o=function(e){let{orgSlug:t}=e,{enabled:n=!0,...r}=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{};return(0,i.a)(a.U.orgSubscription(t),e=>{let{signal:n}=e;return s({orgSlug:t},n)},{enabled:n&&void 0!==t,...r})}},70780:function(e,t,n){"use strict";n.d(t,{G:function(){return o},o:function(){return s}});var i=n(52322),r=n(2784);let a=(0,r.createContext)({formContextOnChange:null,values:null,errors:null,handleBlur:null,touched:null,fieldLevelValidation:null}),s=e=>{let{formContextOnChange:t,values:n,errors:r,handleBlur:s,touched:o,fieldLevelValidation:l}=e;return(0,i.jsx)(a.Provider,{value:{formContextOnChange:t,values:n,errors:r,handleBlur:s,touched:o,fieldLevelValidation:l},children:e.children})},o=()=>{let e=(0,r.useContext)(a);if(void 0===e)throw Error("useFormContextOnChange must be used within a FormContextProvider.");return e}},90488:function(e,t,n){"use strict";var i=n(52322);n(2784);var r=n(52766),a=n(2515);t.Z=function(e){return(0,i.jsx)(a.Z,{icon:r.Z,...e})}},59158:function(e,t,n){"use strict";var i=n(52322);n(2784);var r=n(35807),a=n(2515);t.Z=function(e){return(0,i.jsx)(a.Z,{icon:r.Z,...e})}},84447:function(e,t,n){"use strict";var i=n(52322);n(2784);var r=n(69967),a=n(2515);t.Z=function(e){return(0,i.jsx)(a.Z,{icon:r.Z,...e})}},4191:function(e,t,n){"use strict";var i=n(52322);n(2784);var r=n(56177),a=n(2515);t.Z=function(e){return(0,i.jsx)(a.Z,{icon:r.Z,...e})}},4582:function(e,t,n){"use strict";var i=n(52322);n(2784);var r=n(12570),a=n(2515);t.Z=function(e){return(0,i.jsx)(a.Z,{icon:r.Z,...e})}},84797:function(e,t,n){"use strict";var i=n(52322);n(2784);var r=n(90706),a=n(2515);t.Z=function(e){return(0,i.jsx)(a.Z,{icon:r.Z,...e})}},34509:function(e,t,n){"use strict";var i=n(52322);n(2784);var r=n(3909),a=n(2515);t.Z=function(e){return(0,i.jsx)(a.Z,{icon:r.Z,...e})}},750:function(e,t,n){"use strict";var i=n(52322),r=n(2784),a=n(25001),s=n(71653),o=n(67440),l=n(75109),u=n(46318),c=n(54383),d=n(11170),f=n(70780),h=n(59158);function p(e){let{autoComplete:t,autoFocus:n,className:p,inputClassName:v,iconContainerClassName:x,copy:b,defaultValue:m,descriptionText:j,disabled:_,error:g,icon:z,id:Z="",name:y="",inputRef:C,label:N,afterLabel:w,beforeLabel:k,labelOptional:F,layout:T,onChange:E,onBlur:L,onCopy:O,placeholder:S,type:B="text",value:G,style:P,reveal:V=!1,actions:U,size:q="medium",borderless:A=!1,validation:I,...R}=e,[J,W]=(0,r.useState)("Copy"),[Y,D]=(0,r.useState)(!0),H=(0,u.Z)("input"),{formContextOnChange:K,values:M,errors:Q,handleBlur:X,touched:$,fieldLevelValidation:ee}=(0,f.G)();M&&!G&&(G=M[Z||y]),g||(Q&&!g&&(g=Q[Z||y]),g=$&&$[Z]?g:void 0),(0,r.useEffect)(()=>{I&&ee(Z,I(G))},[]);let et=["peer/input",H.base];return g&&et.push(H.variants.error),g||et.push(H.variants.standard),q&&et.push(H.size[q]),z&&et.push(H.with_icon),_&&et.push(H.disabled),v&&et.push(v),(0,i.jsx)(a.l,{label:N,afterLabel:w,beforeLabel:k,labelOptional:F,layout:T,id:Z,error:g,descriptionText:j,style:P,size:q,className:p,children:(0,i.jsxs)("div",{className:H.container,children:[(0,i.jsx)("input",{"data-size":q,autoComplete:t,autoFocus:n,defaultValue:m,disabled:_,id:Z,name:y,onChange:function(e){E&&E(e),K&&K(e),I&&ee(Z,I(e.target.value))},onBlur:function(e){X&&setTimeout(()=>{X(e)},100),L&&L(e)},onCopy:O,placeholder:S,ref:C,type:B,value:V&&Y?l.aA:G,className:(0,c.cn)(et),...R}),z&&(0,i.jsx)(o.Z,{size:q,icon:z,className:x}),b||g||U?(0,i.jsxs)("div",{className:H.actions_container,children:[g&&(0,i.jsx)(s.Z,{size:q}),b&&!(V&&Y)?(0,i.jsx)(d.z,{size:"tiny",type:"default",icon:(0,i.jsx)(h.Z,{}),onClick:()=>{var e,t;return e=G,void(null===(t=navigator.clipboard.writeText(e))||void 0===t||t.then(function(){W("Copied"),setTimeout(function(){W("Copy")},3e3),null==O||O()},function(){W("Failed to copy")}))},children:J}):null,V&&Y?(0,i.jsx)(d.z,{size:"tiny",type:"default",onClick:function(){D(!1)},children:"Reveal"}):null,U&&U]}):null]})})}p.TextArea=function(e){let{className:t,textAreaClassName:n,descriptionText:o,disabled:l,error:c,icon:p,id:v="",name:x="",label:b,afterLabel:m,beforeLabel:j,labelOptional:_,layout:g,onChange:z,onBlur:Z,placeholder:y,value:C,style:N,rows:w=4,limit:k,size:F,borderless:T=!1,validation:E,copy:L=!1,onCopy:O,actions:S,...B}=e,[G,P]=(0,r.useState)(0),[V,U]=(0,r.useState)("Copy"),{formContextOnChange:q,values:A,errors:I,handleBlur:R,touched:J,fieldLevelValidation:W}=(0,f.G)();A&&!C&&(C=A[v||x]),c||(I&&!c&&(c=I[v||x]),c=J&&J[v||x]?c:void 0),(0,r.useEffect)(()=>{E&&W(v,E(C))},[]);let Y=(0,u.Z)("input"),D=[Y.base];return c&&D.push(Y.variants.error),c||D.push(Y.variants.standard),p&&D.push(Y.with_icon),F&&D.push(Y.size[F]),l&&D.push(Y.disabled),n&&D.push(n),(0,i.jsx)(a.l,{className:t,label:b,afterLabel:m,beforeLabel:j,labelOptional:_,layout:g,id:v,error:c,descriptionText:o,style:N,size:F,children:(0,i.jsxs)("div",{className:Y.container,children:[(0,i.jsx)("textarea",{disabled:l,id:v,name:x,rows:w,cols:100,placeholder:y,onChange:function(e){P(e.target.value.length),z&&z(e),q&&q(e),E&&W(v,E(e.target.value))},onBlur:function(e){R&&setTimeout(()=>{R(e)},100),Z&&Z(e)},onCopy:O,value:C,className:D.join(" "),maxLength:k,...B}),L||c||S?(0,i.jsx)("div",{className:Y.textarea_actions_container,children:(0,i.jsxs)("div",{className:Y.textarea_actions_container_items,children:[c&&(0,i.jsx)(s.Z,{size:F}),L&&(0,i.jsx)(d.z,{size:"tiny",type:"default",onClick:()=>(function(e){navigator.clipboard.writeText(e).then(function(){U("Copied"),setTimeout(function(){U("Copy")},3e3),null==O||O()},function(){U("Failed to copy")})})(C),icon:(0,i.jsx)(h.Z,{}),children:V}),S&&S]})}):null]})})},t.Z=p},61786:function(e,t,n){"use strict";n.d(t,{J2:function(){return u},xo:function(){return c},yk:function(){return d}});var i=n(52322),r=n(13844),a=n(2784),s=n(54383),o=n(59534),l=n.n(o);let u=r.fC,c=r.xz;r.ee;let d=a.forwardRef((e,t)=>{let{className:n,align:o="center",sideOffset:u=4,portal:c=!1,sameWidthAsTrigger:d=!1,...f}=e,h=c?r.h_:a.Fragment;return(0,i.jsx)(h,{children:(0,i.jsx)(r.VY,{ref:t,align:o,sideOffset:u,className:(0,s.cn)(d?l()["popover-trigger-width"]:"","z-50 w-72 rounded-md border border-overlay bg-overlay p-4 text-popover-foreground shadow-md outline-none animate-in data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2",n),...f})})});d.displayName="PopoverContent"},25001:function(e,t,n){"use strict";n.d(t,{l:function(){return a}});var i=n(52322);n(2784);var r=n(18212);function a(e){let{align:t="left",children:n,className:a,descriptionText:s,error:o,id:l,label:u,labelOptional:c,layout:d="vertical",style:f,labelLayout:h,responsive:p=!0,size:v="medium",beforeLabel:x,afterLabel:b,nonBoxInput:m=!u}=e,j=r.Z.form_layout,_="flex"===d,g=[];g.push(j.size[v]);let z=[],Z=[];"horizontal"===d||h||_?"horizontal"===h?z.push(j.labels_horizontal_layout):z.push(j.labels_vertical_layout):z.push(j.labels_horizontal_layout),"horizontal"!==d?Z.push(j.data_input_horizontal_layout):(Z.push(j.data_input_vertical_layout),"right"===t&&Z.push(j.data_input_vertical_layout__align_right)),_?(g.push(j.flex[t].base),"left"===t&&(z.push(j.flex.left.labels),Z.push(j.flex.left.data_input)),"right"===t&&(z.push(j.flex.right.labels),Z.push(j.flex.right.data_input))):g.push(j.container,p?j.responsive:j.non_responsive),a&&g.push(a);let y=!!(u||x||b),C=(0,i.jsx)("p",{"data-state":o?"show":"hide",className:[j.error.base,j.error.size[v]].join(" "),children:o}),N=s&&(0,i.jsx)("div",{className:[j.description.base,j.description.size[v]].join(" "),id:l+"-description",children:s});return(0,i.jsxs)("div",{className:g.join(" "),children:[_&&(0,i.jsx)("div",{className:j.flex[t].content,children:n}),y||c||"horizontal"===d?(0,i.jsxs)("div",{className:z.join(" "),children:[y&&(0,i.jsxs)("label",{className:[j.label.base,j.label.size[v]].join(" "),htmlFor:l,children:[x&&(0,i.jsx)("span",{className:[j.label_before.base,j.label_before.size[v]].join(" "),id:l+"-before",children:x}),u,b&&(0,i.jsx)("span",{className:[j.label_after.base,j.label_after.size[v]].join(" "),id:l+"-after",children:b})]}),c&&(0,i.jsx)("span",{className:[j.label_optional.base,j.label_optional.size[v]].join(" "),id:l+"-optional",children:c}),_&&(0,i.jsxs)(i.Fragment,{children:[N,C]})]}):null,!_&&(0,i.jsx)("div",{className:Z.join(" "),style:f,children:(0,i.jsxs)(i.Fragment,{children:[(0,i.jsx)("div",{className:m&&u&&"vertical"===d?j.non_box_data_input_spacing_vertical:m&&u&&"horizontal"===d?j.non_box_data_input_spacing_horizontal:"",children:n}),C,N]})})]})}},71653:function(e,t,n){"use strict";n.d(t,{Z:function(){return s}});var i=n(52322);n(2784);var r=n(46318),a=n(39459);function s(e){let{style:t,size:n}=e,s=(0,r.Z)("inputErrorIcon");return(0,i.jsx)("div",{className:s.base,style:t,children:(0,i.jsx)(a.Z,{size:n,strokeWidth:2})})}},67440:function(e,t,n){"use strict";n.d(t,{Z:function(){return s}});var i=n(52322);n(2784);var r=n(46318),a=n(54383);function s(e){let{icon:t,className:n,size:s}=e,o=(0,r.Z)("inputIconContainer");return(0,i.jsx)("div",{className:(0,a.cn)(o.base,o.size[s],n),children:t})}},59534:function(e){e.exports={"popover-trigger-width":"popover_popover-trigger-width__O8y9q"}}}]);