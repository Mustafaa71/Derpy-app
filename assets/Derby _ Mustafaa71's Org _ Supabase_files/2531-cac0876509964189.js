"use strict";(self.webpackChunk_N_E=self.webpackChunk_N_E||[]).push([[2531],{91872:function(e,s,t){var n=t(52322),a=t(2784),i=t(90488),r=t(54506);s.Z=e=>{let{commands:s}=e;return(0,n.jsx)("div",{className:"space-y-4",children:s.map((e,s)=>(0,n.jsx)(l,{item:e},"command-".concat(s)))})};let l=e=>{let{item:s}=e,[t,l]=(0,a.useState)(!1);return(0,n.jsxs)("div",{className:"space-y-1",children:[(0,n.jsx)("span",{className:"font-mono text-sm text-foreground-lighter",children:"> ".concat(s.comment)}),(0,n.jsx)("div",{className:"flex items-center gap-2",children:(0,n.jsxs)("div",{className:"flex gap-2 font-mono text-sm font-normal text-foreground",children:[(0,n.jsx)("span",{className:"text-foreground-lighter",children:"$"}),(0,n.jsxs)("span",{children:[(0,n.jsxs)("span",{children:[s.jsx?s.jsx():null," "]}),(0,n.jsx)("button",{type:"button",className:"text-foreground-lighter hover:text-foreground",onClick:()=>{var e;e=s.command,l(!0),navigator.clipboard.writeText(e).then(),setTimeout(function(){l(!1)},3e3)},children:t?(0,n.jsx)("div",{className:"text-brand",children:(0,n.jsx)(i.Z,{size:14,strokeWidth:3})}):(0,n.jsx)("div",{className:"relative",children:(0,n.jsx)("div",{className:"block",children:(0,n.jsx)(r.Z,{size:14})})})})]})]})})]})}},4651:function(e,s,t){t.d(s,{Hk:function(){return W},vI:function(){return B},Zv:function(){return G},ds:function(){return $}});var n=t(52322),a=t(24990),i=t(59491),r=t(6277),l=t(99959),o=t(28879),c=t.n(o),d=t(39097),u=t.n(d),x=t(5632),h=t(2784),m=t(62202),p=t(14698),f=t(64306),j=t(53535),g=t(22721),v=t(22657),b=t(85945),N=t(48228),y=t(88354),w=t(99248),k=t(66437);async function Z(e){let{projectRef:s,slug:t}=e;if(!s)throw Error("projectRef is required");let n=await (0,y.$v)("".concat(w.Q2,"/projects/").concat(s,"/functions/").concat(t),{});if(n.error)throw n.error;return n}let E=function(){let{onSuccess:e,onError:s,...t}=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{},n=(0,b.NL)();return(0,N.D)(e=>Z(e),{async onSuccess(s,t,a){let{projectRef:i}=t;await n.invalidateQueries(k.f.list(i),{refetchType:"all"}),await (null==e?void 0:e(s,t,a))},async onError(e,t,n){void 0===s?m.Am.error("Failed to delete edge function: ".concat(e.message)):s(e,t,n)},...t})};async function C(e){let{projectRef:s,slug:t,payload:n}=e;if(!s)throw Error("projectRef is required");let a=await (0,y.r$)("".concat(w.Q2,"/projects/").concat(s,"/functions/").concat(t),n);if(a.error)throw a.error;return a}let A=function(){let{onSuccess:e,onError:s,...t}=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{},n=(0,b.NL)();return(0,N.D)(e=>C(e),{async onSuccess(s,t,a){let{projectRef:i,slug:r}=t;await n.invalidateQueries(k.f.detail(i,r)),await (null==e?void 0:e(s,t,a))},async onError(e,t,n){void 0===s?m.Am.error("Failed to update edge function: ".concat(e.message)):s(e,t,n)},...t})};var F=t(14528),Y=t(62277),_=t(750),z=t(22854),R=t(11170),S=t(32830),D=t(42756),M=t(84797),O=t(4582),T=t(48869),U=t(47852),L=t(91872);let I=(e,s,t)=>({managementCommands:[{command:"supabase functions deploy ".concat(null==e?void 0:e.slug),description:"This will overwrite the deployed function with your new function",jsx:()=>(0,n.jsxs)(n.Fragment,{children:[(0,n.jsx)("span",{className:"text-brand-600",children:"supabase"})," functions deploy"," ",null==e?void 0:e.slug]}),comment:"Deploy a new version"},{command:"supabase functions delete ".concat(null==e?void 0:e.slug),description:"This will remove the function and all the logs associated with it",jsx:()=>(0,n.jsxs)(n.Fragment,{children:[(0,n.jsx)("span",{className:"text-brand-600",children:"supabase"})," functions delete"," ",null==e?void 0:e.slug]}),comment:"Delete the function"}],secretCommands:[{command:"supabase secrets list",description:"This will list all the secrets for your project",jsx:()=>(0,n.jsxs)(n.Fragment,{children:[(0,n.jsx)("span",{className:"text-brand-600",children:"supabase"})," secrets list"]}),comment:"View all secrets"},{command:"supabase secrets set NAME1=VALUE1 NAME2=VALUE2",description:"This will set secrets for your project",jsx:()=>(0,n.jsxs)(n.Fragment,{children:[(0,n.jsx)("span",{className:"text-brand-600",children:"supabase"})," secrets set NAME1=VALUE1 NAME2=VALUE2"]}),comment:"Set secrets for your project"},{command:"supabase secrets unset NAME1 NAME2 ",description:"This will delete secrets for your project",jsx:()=>(0,n.jsxs)(n.Fragment,{children:[(0,n.jsx)("span",{className:"text-brand-600",children:"supabase"})," secrets unset NAME1 NAME2"]}),comment:"Unset secrets for your project"}],invokeCommands:[{command:"curl -L -X POST '".concat(s,"' -H 'Authorization: Bearer ").concat(null!=t?t:"[YOUR ANON KEY]",'\' --data \'{"name":"Functions"}\''),description:"Invokes the hello function",jsx:()=>(0,n.jsxs)(n.Fragment,{children:[(0,n.jsx)("span",{className:"text-brand-600",children:"curl"})," -L -X POST '",s,"' -H 'Authorization: Bearer [YOUR ANON KEY]' ",'--data \'{"name":"Functions"}\'']}),comment:"Invoke your function"}]});var W=()=>{var e,s;let t=(0,x.useRouter)(),{ref:o,functionSlug:d}=(0,l.UO)(),[b,N]=(0,h.useState)(!1),[y,w]=(0,h.useState)(!1),{data:k}=(0,j.q)({projectRef:o}),{data:Z}=(0,g.z)({projectRef:o}),{data:C}=(0,v.J)({projectRef:o,slug:d}),{mutateAsync:W,isLoading:P}=A(),{mutate:H,isLoading:V}=E({onSuccess:()=>{m.ZP.success('Successfully deleted "'.concat(null==C?void 0:C.name,'"')),t.push("/project/".concat(o,"/functions"))}}),q="edge-function-update-form",K=(0,F.Xo)(i.KA.FUNCTIONS_WRITE,"*"),B=null==k?void 0:k.autoApiService,J=(null==B?void 0:B.service_api_keys.find(e=>"anon key"===e.name))?B.defaultApiKey:"[YOUR ANON KEY]",Q=null!==(s=null==B?void 0:B.app_config.endpoint)&&void 0!==s?s:"",X=(null==Z?void 0:null===(e=Z.customDomain)||void 0===e?void 0:e.status)==="active"?"".concat(null==B?void 0:B.protocol,"://").concat(Z.customDomain.hostname,"/functions/v1/").concat(null==C?void 0:C.slug):"".concat(null==B?void 0:B.protocol,"://").concat(Q,"/functions/v1/").concat(null==C?void 0:C.slug),{managementCommands:$,secretCommands:G,invokeCommands:ee}=I(C,X,J),es=async(e,s)=>{let{resetForm:t}=s;if(!o)return console.error("Project ref is required");if(void 0===C)return console.error("No edge function selected");try{await W({projectRef:o,slug:C.slug,payload:e}),t({values:e,initialValues:e}),m.ZP.success("Successfully updated edge function")}catch(e){}},et=async()=>o?void 0===C?console.error("No edge function selected"):void H({projectRef:o,slug:C.slug}):console.error("Project ref is required"),en=(0,h.useMemo)(()=>(null==C?void 0:C.import_map)||(null==C?void 0:C.import_map_path),[C]);return(0,n.jsxs)(n.Fragment,{children:[(0,n.jsxs)("div",{className:"space-y-4 pb-16",children:[(0,n.jsx)(Y.Z,{id:q,initialValues:{},onSubmit:es,children:e=>{var s,t,a;let{handleReset:i,values:l,initialValues:o,resetForm:d}=e,x=JSON.stringify(l)!==JSON.stringify(o);return(0,h.useEffect)(()=>{if(void 0!==C){let e={name:null==C?void 0:C.name,verify_jwt:null==C?void 0:C.verify_jwt};d({values:e,initialValues:e})}},[C]),(0,n.jsx)(n.Fragment,{children:(0,n.jsxs)(p.by,{disabled:!K,footer:(0,n.jsx)("div",{className:"flex py-4 px-8",children:(0,n.jsx)(p.iN,{form:q,isSubmitting:P,hasChanges:x,handleReset:i,helper:K?void 0:"You need additional permissions to update this function"})}),children:[(0,n.jsx)(p.hj,{header:(0,n.jsx)(p.S0,{children:"Function Details"}),children:(0,n.jsxs)(p.B4,{loading:void 0===C,children:[(0,n.jsx)(_.Z,{id:"name",name:"name",label:"Name"}),(0,n.jsx)(_.Z,{disabled:!0,id:"slug",name:"slug",label:"Slug",value:null==C?void 0:C.slug}),(0,n.jsx)(_.Z,{disabled:!0,copy:!0,label:"Endpoint URL",value:X}),(0,n.jsx)(_.Z,{disabled:!0,label:"Region",value:"All functions are deployed globally"}),(0,n.jsx)(_.Z,{disabled:!0,label:"Created at",value:c()(null!==(s=null==C?void 0:C.created_at)&&void 0!==s?s:0).format("dddd, MMMM D, YYYY h:mm A")}),(0,n.jsx)(_.Z,{disabled:!0,label:"Last updated at",value:c()(null!==(t=null==C?void 0:C.updated_at)&&void 0!==t?t:0).format("dddd, MMMM D, YYYY h:mm A")}),(0,n.jsx)(_.Z,{disabled:!0,label:"Deployments",value:null!==(a=null==C?void 0:C.version)&&void 0!==a?a:0})]})}),(0,n.jsx)(p.hj,{header:(0,n.jsx)(p.S0,{children:"Function Configuration"}),children:(0,n.jsxs)(p.B4,{loading:void 0===C,children:[(0,n.jsx)(z.Z,{id:"verify_jwt",name:"verify_jwt",label:"Enforce JWT Verification",descriptionText:"Require a valid JWT in the authorization header when invoking the function"}),(0,n.jsxs)("div",{className:"space-y-1 border rounded border-default bg-surface-200 px-4 py-4",children:[(0,n.jsx)("div",{className:"flex items-center space-x-2",children:(0,n.jsxs)("p",{className:"text-sm",children:["Import maps are"," ",(0,n.jsx)("span",{className:(0,r.default)(en?"text-brand":"text-amber-900"),children:en?"used":"not used"})," ","for this function"]})}),(0,n.jsx)("p",{className:"text-sm text-foreground-light",children:"Import maps allow the use of bare specifiers in functions instead of explicit import URLs"}),(0,n.jsx)("div",{className:"!mt-4",children:(0,n.jsx)(R.z,{asChild:!0,type:"default",icon:(0,n.jsx)(S.Z,{strokeWidth:1.5}),children:(0,n.jsx)(u(),{href:"https://supabase.com/docs/guides/functions/import-maps",target:"_blank",rel:"noreferrer",children:"More about import maps"})})})]})]})})]})})}}),(0,n.jsxs)("div",{className:"space-y-6 rounded border bg-surface-100 px-6 py-4 drop-shadow-sm transition-all overflow-hidden",style:{maxHeight:y?800:66},children:[(0,n.jsxs)("div",{className:"flex items-center justify-between",children:[(0,n.jsxs)("div",{className:"flex items-center space-x-3",children:[(0,n.jsx)("div",{className:"flex h-8 w-8 items-center justify-center rounded border bg-foreground p-2 text-background",children:(0,n.jsx)(D.Z,{strokeWidth:2})}),(0,n.jsx)("h4",{children:"Command line access"})]}),(0,n.jsx)("div",{className:"cursor-pointer",onClick:()=>w(!y),children:y?(0,n.jsx)(M.Z,{size:14,strokeWidth:1.5}):(0,n.jsx)(O.Z,{size:14,strokeWidth:1.5})})]}),(0,n.jsx)("h5",{className:"text-base",children:"Deployment management"}),(0,n.jsx)(L.Z,{commands:$}),(0,n.jsx)("h5",{className:"text-base",children:"Invoke "}),(0,n.jsx)(L.Z,{commands:ee}),(0,n.jsx)("h5",{className:"text-base",children:"Secrets management"}),(0,n.jsx)(L.Z,{commands:G})]}),(0,n.jsxs)("div",{className:"!mt-8",children:[(0,n.jsx)(p.ph,{title:"Delete Edge Function",description:""}),(0,n.jsx)(f.Z,{children:(0,n.jsx)(f.Z.Content,{children:(0,n.jsxs)(T.b,{withIcon:!0,variant:"danger",title:"Once your function is deleted, it can no longer be restored",children:[(0,n.jsx)("p",{className:"mb-3",children:"Make sure you have made a backup if you want to restore your edge function"}),(0,n.jsxs)(a.fC,{delayDuration:0,children:[(0,n.jsx)(a.xz,{asChild:!0,children:(0,n.jsx)(R.z,{type:"danger",disabled:!K,loading:(null==C?void 0:C.id)===void 0,onClick:()=>N(!0),children:"Delete edge function"})}),!K&&(0,n.jsx)(a.h_,{children:(0,n.jsxs)(a.VY,{side:"bottom",children:[(0,n.jsx)(a.Eh,{className:"radix-tooltip-arrow"}),(0,n.jsx)("div",{className:"rounded bg-alternative py-1 px-2 leading-none shadow border border-background",children:(0,n.jsx)("span",{className:"text-xs text-foreground",children:"You need additional permissions to delete an edge function"})})]})})]})]})})})]})]}),(0,n.jsx)(U.C,{size:"small",alignFooter:"right",header:(0,n.jsxs)("h3",{children:["Confirm to delete ",null==C?void 0:C.name]}),visible:b,loading:V,onCancel:()=>N(!1),onConfirm:et,children:(0,n.jsx)("div",{className:"py-6",children:(0,n.jsx)(U.C.Content,{children:(0,n.jsx)(T.b,{withIcon:!0,variant:"warning",title:"This action cannot be undone",children:"Ensure that you have made a backup if you want to restore your edge function"})})})})]})},P=t(90488),H=t(54506),V=t(66760),q=t(27570),K=t(15735),B=e=>{var s;let{function:t}=e,i=(0,x.useRouter)(),{ref:r}=(0,V.UO)(),{project:l}=(0,q.d2)(),[o,d]=(0,h.useState)(!1),{data:u}=(0,g.z)({projectRef:r}),m=null==l?void 0:l.restUrl,p=void 0!==m?new URL(m).hostname.split(".").pop():"co",f="https://".concat(r,".supabase.").concat(p,"/functions/v1/").concat(t.slug),j=(null==u?void 0:null===(s=u.customDomain)||void 0===s?void 0:s.status)==="active"?"https://".concat(u.customDomain.hostname,"/functions/v1/").concat(t.slug):f;return(0,n.jsxs)(K.Z.tr,{onClick:()=>{i.push("/project/".concat(r,"/functions/").concat(t.slug,"/details"))},children:[(0,n.jsx)(K.Z.td,{children:(0,n.jsx)("div",{className:"flex items-center gap-2",children:(0,n.jsx)("p",{className:"text-sm text-foreground",children:t.name})})}),(0,n.jsx)(K.Z.td,{children:(0,n.jsxs)("div",{className:"text-xs text-foreground-light flex gap-2 items-center truncate",children:[(0,n.jsx)("p",{className:"font-mono truncate hidden md:inline",children:j}),(0,n.jsx)("button",{type:"button",className:"text-foreground-lighter hover:text-foreground transition",onClick:e=>{e.stopPropagation(),d(!0),navigator.clipboard.writeText(j).then(),setTimeout(function(){d(!1)},3e3)},children:o?(0,n.jsx)("div",{className:"text-brand",children:(0,n.jsx)(P.Z,{size:14,strokeWidth:3})}):(0,n.jsx)("div",{className:"relative",children:(0,n.jsx)("div",{className:"block",children:(0,n.jsx)(H.Z,{size:14,strokeWidth:1.5})})})})]})}),(0,n.jsx)(K.Z.td,{className:"hidden 2xl:table-cell",children:(0,n.jsx)("p",{className:"text-foreground-light",children:c()(t.created_at).format("DD MMM, YYYY HH:mm")})}),(0,n.jsx)(K.Z.td,{className:"lg:table-cell",children:(0,n.jsxs)(a.fC,{delayDuration:0,children:[(0,n.jsx)(a.xz,{children:(0,n.jsx)("div",{className:"flex items-center space-x-2",children:(0,n.jsx)("p",{className:"text-sm text-foreground-light",children:c()(t.updated_at).fromNow()})})}),(0,n.jsx)(a.h_,{children:(0,n.jsxs)(a.VY,{side:"bottom",children:[(0,n.jsx)(a.Eh,{className:"radix-tooltip-arrow"}),(0,n.jsx)("div",{className:"rounded bg-alternative py-1 px-2 leading-none shadow border border-background",children:(0,n.jsxs)("span",{className:"text-xs text-foreground",children:["Last updated on ",c()(t.updated_at).format("DD MMM, YYYY HH:mm")]})})]})})]})}),(0,n.jsx)(K.Z.td,{className:"lg:table-cell",children:(0,n.jsx)("p",{className:"text-foreground-light",children:t.version})})]},t.id)},J=t(31036),Q=t(52995),X=t(63294),$=e=>{var s,t;let{closable:a=!1,removeBorder:i=!1}=e,r=(0,x.useRouter)(),{ref:l}=(0,V.UO)(),[o,c]=(0,h.useState)(!a),{data:d}=(0,X.h)(),{data:m}=(0,j.q)({projectRef:l}),{data:p}=(0,g.z)({projectRef:l}),f=null==m?void 0:m.autoApiService,v=(null==f?void 0:f.service_api_keys.find(e=>"anon key"===e.name))?f.defaultApiKey:"[YOUR ANON KEY]",b=null!==(t=null==m?void 0:m.autoApiService.app_config.endpoint)&&void 0!==t?t:"",N=(null==p?void 0:null===(s=p.customDomain)||void 0===s?void 0:s.status)==="active"?"https://".concat(p.customDomain.hostname,"/functions/v1"):"https://".concat(b,"/functions/v1"),y=null==m?void 0:m.autoApiService.restUrl,w=y?new URL(y).hostname.split(".").pop():"co",k=[{command:"supabase functions new hello-world",description:" creates a function stub at ./functions/hello-world/index.ts",jsx:()=>(0,n.jsxs)(n.Fragment,{children:[(0,n.jsx)("span",{className:"text-brand-600",children:"supabase"})," functions new hello-world"]}),comment:"Create a function"},{command:"supabase functions deploy hello-world --project-ref ".concat(l),description:"Deploys function at ./functions/hello-world/index.ts",jsx:()=>(0,n.jsxs)(n.Fragment,{children:[(0,n.jsx)("span",{className:"text-brand-600",children:"supabase"})," functions deploy hello-world --project-ref ",l]}),comment:"Deploy your function"},{command:"curl -L -X POST 'https://".concat(l,".supabase.").concat(w,"/functions/v1/hello-world' -H 'Authorization: Bearer ").concat(null!=v?v:"[YOUR ANON KEY]",'\' --data \'{"name":"Functions"}\''),description:"Invokes the hello-world function",jsx:()=>(0,n.jsxs)(n.Fragment,{children:[(0,n.jsx)("span",{className:"text-brand-600",children:"curl"})," -L -X POST '",N,"/hello-world' -H 'Authorization: Bearer [YOUR ANON KEY]'"," ",'--data \'{"name":"Functions"}\'']}),comment:"Invoke your function"}];return(0,n.jsxs)("div",{className:"col-span-7 overflow-hidden transition-all rounded bg-surface-100 ".concat(i?"":"border shadow"),style:{maxHeight:o?500:80},children:[(0,n.jsxs)("div",{className:"px-8 py-6 space-y-6",children:[(0,n.jsxs)("div",{className:"flex items-center justify-between",children:[(0,n.jsxs)("div",{className:"flex items-center gap-3",children:[(0,n.jsx)("div",{className:"flex items-center justify-center w-8 h-8 p-2 border rounded bg-alternative",children:(0,n.jsx)(D.Z,{strokeWidth:2})}),(0,n.jsx)("h4",{children:"Create your first Edge Function via the CLI"})]}),a&&(0,n.jsx)("div",{className:"cursor-pointer",onClick:()=>c(!o),children:o?(0,n.jsx)(M.Z,{size:14,strokeWidth:1.5}):(0,n.jsx)(O.Z,{size:14,strokeWidth:1.5})})]}),(0,n.jsx)("div",{children:(0,n.jsx)(L.Z,{commands:k})})]}),d&&0===d.length?(0,n.jsxs)("div",{className:"px-8 py-6 space-y-3 border-t",children:[(0,n.jsxs)("div",{children:[(0,n.jsx)("h3",{className:"text-base text-foreground",children:"You may need to create an access token"}),(0,n.jsx)("p",{className:"text-sm text-foreground-light",children:"You can create a secure access token in your account section"})]}),(0,n.jsx)(R.z,{type:"default",onClick:()=>r.push("/account/tokens"),children:"Access tokens"})]}):(0,n.jsxs)("div",{className:"px-8 py-6 space-y-3 border-t",children:[(0,n.jsxs)("div",{children:[(0,n.jsx)("h3",{className:"text-base text-foreground",children:"Need help?"}),(0,n.jsx)("p",{className:"text-sm text-foreground-light",children:"Read the documentation, or browse some sample code."})]}),(0,n.jsxs)("div",{className:"flex gap-2",children:[(0,n.jsx)(R.z,{asChild:!0,type:"default",iconRight:(0,n.jsx)(J.Z,{}),children:(0,n.jsx)(u(),{href:"https://supabase.com/docs/guides/functions",target:"_blank",rel:"noreferrer",children:"Documentation"})}),(0,n.jsx)(R.z,{asChild:!0,type:"default",iconRight:(0,n.jsx)(Q.Z,{}),children:(0,n.jsx)(u(),{href:"https://github.com/supabase/supabase/tree/master/examples/edge-functions/supabase/functions",target:"_blank",rel:"noreferrer",children:"Examples"})})]})]})]})},G=()=>(0,n.jsx)(n.Fragment,{children:(0,n.jsxs)("div",{className:"grid max-w-7xl gap-y-12 py-12 lg:grid-cols-12 lg:gap-x-16",children:[(0,n.jsxs)("div",{className:"col-span-5 space-y-4",children:[(0,n.jsx)("p",{className:"max-w-lg text-base text-foreground",children:"Scalable functions to run your code with no server management."}),(0,n.jsx)("p",{className:"max-w-lg text-sm text-foreground-light",children:"Edge Functions are server-side Typescript functions, distributed globally at the edge - close to your users. They can be used for listening to webhooks or integrating your Supabase project with third-parties."}),(0,n.jsxs)("div",{className:"flex gap-2",children:[(0,n.jsx)(R.z,{asChild:!0,type:"default",iconRight:(0,n.jsx)(J.Z,{}),children:(0,n.jsx)(u(),{href:"https://supabase.com/docs/guides/functions",target:"_blank",rel:"noreferrer",children:"Documentation"})}),(0,n.jsx)(R.z,{asChild:!0,type:"default",iconRight:(0,n.jsx)(Q.Z,{}),children:(0,n.jsx)(u(),{href:"https://github.com/supabase/supabase/tree/master/examples/edge-functions/supabase/functions",target:"_blank",rel:"noreferrer",children:"Examples"})})]})]}),(0,n.jsx)($,{})]})})},50535:function(e,s,t){t.d(s,{Z:function(){return N}});var n=t(52322),a=t(59491),i=t(39097),r=t.n(i),l=t(99959),o=t(63910),c=t(53449),d=t(14782),u=t(22657),x=t(21970),h=t(14528),m=t(52995),p=t(11170),f=t(32830),j=t(9015),g=t(5632),v=e=>{let{item:s}=e,t=(0,g.useRouter)(),a=t.pathname.split("/")[5],{ref:i}=t.query;return(0,n.jsxs)(j.Z,{defaultActiveId:"1",type:"underlined",size:"medium",activeId:a||"metrics",onChange:e=>t.push("/project/".concat(i,"/functions/").concat(s.slug,"/").concat("metrics"===e?"":e)),children:[(0,n.jsx)(j.Z.Panel,{id:"details",label:"Details"}),(0,n.jsx)(j.Z.Panel,{id:"metrics",label:"Metrics"}),(0,n.jsx)(j.Z.Panel,{id:"invocations",label:"Invocations"}),(0,n.jsx)(j.Z.Panel,{id:"logs",label:"Logs"})]})},b=t(92099),N=(0,h.QO)(e=>{let{title:s,children:t}=e,{functionSlug:i,ref:j}=(0,l.UO)(),g=(0,o.cg)(),{data:N,isLoading:y}=(0,x.I)({projectRef:j}),{data:w}=(0,u.J)({projectRef:j,slug:i});if(!(0,h.Xo)(a.KA.FUNCTIONS_READ,"*"))return(0,n.jsx)(b.AM,{title:s||"Edge Functions",product:"Edge Functions",children:(0,n.jsx)("main",{style:{maxHeight:"100vh"},className:"flex-1 overflow-y-auto",children:(0,n.jsx)(d.Z,{isFullPage:!0,resourceText:"access your project's edge functions"})})});let k=(null==w?void 0:w.name)||"",Z=(null!=N?N:[]).length>0;return(0,n.jsx)(b.AM,{isLoading:y,title:s||"Edge Functions",product:"Edge Functions",children:Z?(0,n.jsxs)("div",{className:"flex h-full flex-grow flex-col py-6",children:[(0,n.jsxs)("div",{className:"mx-auto flex w-full flex-col transition-all 1xl:px-28 gap-4 px-5 lg:px-16 xl:px-24 2xl:px-32",children:[(0,n.jsx)("div",{className:"item-center flex flex-col justify-between gap-y-4 xl:flex-row",children:(0,n.jsxs)("div",{className:"flex items-center gap-3 w-full",children:[(0,n.jsx)("div",{className:"h-6 w-6 rounded border border-brand-600 bg-brand-300 flex items-center justify-center text-brand",children:(0,n.jsx)(m.Z,{size:14,strokeWidth:3})}),(0,n.jsxs)("div",{className:"flex items-center justify-between w-full",children:[(0,n.jsxs)("div",{className:"flex items-center space-x-4",children:[(0,n.jsx)(r(),{href:"/project/".concat(j,"/functions"),children:(0,n.jsx)("h1",{className:"cursor-pointer text-2xl text-foreground transition-colors hover:text-foreground-light",children:"Edge Functions"})}),k&&(0,n.jsxs)("div",{className:"mt-1.5 flex items-center space-x-4",children:[(0,n.jsx)("span",{className:"text-foreground-light",children:(0,n.jsx)("svg",{viewBox:"0 0 24 24",width:"16",height:"16",stroke:"currentColor",strokeWidth:"1",strokeLinecap:"round",strokeLinejoin:"round",fill:"none",shapeRendering:"geometricPrecision",children:(0,n.jsx)("path",{d:"M16 3.549L7.12 20.600"})})}),(0,n.jsx)("h5",{className:"text-lg text-foreground",children:k})]})]}),(0,n.jsxs)("div",{className:"flex items-center space-x-2",children:[(0,n.jsx)(p.z,{asChild:!0,type:"default",children:(0,n.jsx)(r(),{href:"/project/".concat(j,"/settings/functions"),children:"Manage secrets"})}),g&&(0,n.jsx)(c.Z,{section:void 0!==i?["edge-functions",i]:["edge-functions"]}),(0,n.jsx)(p.z,{asChild:!0,type:"default",className:"translate-y-[1px]",icon:(0,n.jsx)(f.Z,{size:14,strokeWidth:1.5}),children:(0,n.jsx)(r(),{href:"https://supabase.com/docs/guides/functions",target:"_link",children:"Documentation"})})]})]})]})}),void 0!==i&&(0,n.jsx)(v,{item:w})]}),(0,n.jsx)("div",{className:"mx-auto flex h-full w-full flex-grow flex-col transition-all 1xl:px-28 gap-4 px-5 lg:px-16 xl:px-24 2xl:px-32",children:t})]}):(0,n.jsx)(n.Fragment,{children:(0,n.jsxs)("div",{className:"mx-auto max-w-5xl py-24 px-5",children:[(0,n.jsx)("div",{className:"item-center flex flex-col justify-between gap-y-4 xl:flex-row",children:(0,n.jsx)("div",{className:"flex items-center gap-3",children:(0,n.jsx)("div",{className:"flex items-center space-x-4",children:(0,n.jsx)("h1",{className:"text-2xl text-foreground",children:"Edge Functions"})})})}),t]})})})})},63294:function(e,s,t){t.d(s,{h:function(){return o}});var n=t(36492),a=t(88354),i=t(99248),r=t(22066);async function l(e){let s=await (0,a.U2)("".concat(i.T5,"/profile/access-tokens"),{signal:e});if(!(0,a.d8)(s))throw s.error;return s}let o=function(){let{enabled:e=!0,...s}=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};return(0,n.a)(r.C.list(),e=>{let{signal:s}=e;return l(s)},s)}},22066:function(e,s,t){t.d(s,{C:function(){return n}});let n={list:()=>["access-tokens"]}},22657:function(e,s,t){t.d(s,{J:function(){return o}});var n=t(36492),a=t(88354),i=t(99248),r=t(66437);async function l(e,s){let{projectRef:t,slug:n}=e;if(!t)throw Error("projectRef is required");if(!n)throw Error("slug is required");let r=await (0,a.U2)("".concat(i.Q2,"/projects/").concat(t,"/functions/").concat(n),{signal:s});if(r.error)throw r.error;return r}let o=function(e){let{projectRef:s,slug:t}=e,{enabled:a=!0,...o}=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{};return(0,n.a)(r.f.detail(s,t),e=>{let{signal:n}=e;return l({projectRef:s,slug:t},n)},{enabled:i.Qy&&a&&void 0!==s&&void 0!==t,...o})}}}]);