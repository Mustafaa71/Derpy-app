(self.webpackChunk_N_E=self.webpackChunk_N_E||[]).push([[5589],{29345:function(e,n,t){(window.__NEXT_P=window.__NEXT_P||[]).push(["/project/[ref]/auth/rate-limits",function(){return t(5261)}])},62697:function(e,n,t){"use strict";t.d(n,{F:function(){return s},n:function(){return r}});let r=e=>{var n;return!!((null==e?void 0:e.SMTP_ADMIN_EMAIL)&&(null==e?void 0:e.SMTP_SENDER_NAME)&&(null==e?void 0:e.SMTP_USER)&&(null==e?void 0:e.SMTP_HOST)&&(null==e?void 0:e.SMTP_PASS)&&(null==e?void 0:e.SMTP_PORT)&&(null!==(n=null==e?void 0:e.SMTP_MAX_FREQUENCY)&&void 0!==n?n:0)>=0)},s=e=>{var n,t,s,i,l,o,a,d;return{ENABLE_SMTP:r(e),SMTP_ADMIN_EMAIL:null!==(n=null==e?void 0:e.SMTP_ADMIN_EMAIL)&&void 0!==n?n:"",SMTP_SENDER_NAME:null!==(t=null==e?void 0:e.SMTP_SENDER_NAME)&&void 0!==t?t:"",SMTP_USER:null!==(s=null==e?void 0:e.SMTP_USER)&&void 0!==s?s:"",SMTP_HOST:null!==(i=null==e?void 0:e.SMTP_HOST)&&void 0!==i?i:"",SMTP_PASS:null!==(l=null==e?void 0:e.SMTP_PASS)&&void 0!==l?l:"",SMTP_PORT:null!==(o=null==e?void 0:e.SMTP_PORT)&&void 0!==o?o:"465",SMTP_MAX_FREQUENCY:null!==(a=null==e?void 0:e.SMTP_MAX_FREQUENCY)&&void 0!==a?a:60,RATE_LIMIT_EMAIL_SENT:null!==(d=null==e?void 0:e.RATE_LIMIT_EMAIL_SENT)&&void 0!==d?d:30}}},95569:function(e,n,t){"use strict";t.d(n,{_:function(){return d}});var r=t(85945),s=t(48228),i=t(62202),l=t(31696),o=t(7161);async function a(e){let{projectRef:n,config:t}=e,{data:r,error:s}=await (0,l.r$)("/platform/auth/{ref}/config",{params:{path:{ref:n}},body:{...t}});if(s)throw s;return r}let d=function(){let{onSuccess:e,onError:n,...t}=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{},l=(0,r.NL)();return(0,s.D)(e=>a(e),{async onSuccess(n,t,r){let{projectRef:s}=t;await l.invalidateQueries(o.o.authConfig(s)),await (null==e?void 0:e(n,t,r))},async onError(e,t,r){void 0===n?i.ZP.error("Failed to update auth configuration: ".concat(e.message)):n(e,t,r)},...t})}},5261:function(e,n,t){"use strict";t.r(n),t.d(n,{default:function(){return v}});var r=t(52322),s=t(59491),i=t(88883),l=t(99959),o=t(39097),a=t.n(o),d=t(2784),u=t(63955),c=t(22574),h=t(42070),_=t(95492),E=t(11170),m=t(30195),T=t(56006),x=t(14698),S=t(41679),M=t(33635),j=t(95569),I=t(14528),N=t(62202),f=t(70847),p=t(62697),R=()=>{let e="auth-rate-limits-form",{ref:n}=(0,l.UO)(),t=(0,I.Xo)(s.KA.UPDATE,"custom_config_gotrue"),{data:o,error:R,isLoading:A,isError:g,isSuccess:b}=(0,M.$E)({projectRef:n}),{mutate:v,isLoading:L}=(0,j._)({onSuccess:()=>{N.ZP.success("Rate limits successfully updated")},onError:e=>{N.ZP.error("Failed to update rate limits: ".concat(e.message))}}),P=(null==o?void 0:o.EXTERNAL_EMAIL_ENABLED)&&(0,p.n)(o),y=(null==o?void 0:o.EXTERNAL_PHONE_ENABLED)&&!(null==o?void 0:o.SMS_AUTOCONFIRM),O=null==o?void 0:o.EXTERNAL_ANONYMOUS_USERS_ENABLED,w=m.Ry({RATE_LIMIT_TOKEN_REFRESH:m.oQ.number().min(0,"Must be not be lower than 0").max(32767,"Must not be more than 32,767 an 5 minutes"),RATE_LIMIT_VERIFY:m.oQ.number().min(0,"Must be not be lower than 0").max(32767,"Must not be more than 32,767 an 5 minutes"),RATE_LIMIT_EMAIL_SENT:m.oQ.number().min(0,"Must be not be lower than 0").max(32767,"Must not be more than 32,767 an hour"),RATE_LIMIT_SMS_SENT:m.oQ.number().min(0,"Must be not be lower than 0").max(32767,"Must not be more than 32,767 an hour"),RATE_LIMIT_ANONYMOUS_USERS:m.oQ.number().min(0,"Must be not be lower than 0").max(32767,"Must not be more than 32,767 an hour")}),F=(0,u.cI)({resolver:(0,i.F)(w),defaultValues:{RATE_LIMIT_TOKEN_REFRESH:0,RATE_LIMIT_VERIFY:0,RATE_LIMIT_EMAIL_SENT:0,RATE_LIMIT_SMS_SENT:0}});return(0,d.useEffect)(()=>{b&&F.reset({RATE_LIMIT_TOKEN_REFRESH:o.RATE_LIMIT_TOKEN_REFRESH,RATE_LIMIT_VERIFY:o.RATE_LIMIT_VERIFY,RATE_LIMIT_EMAIL_SENT:o.RATE_LIMIT_EMAIL_SENT,RATE_LIMIT_SMS_SENT:o.RATE_LIMIT_SMS_SENT,RATE_LIMIT_ANONYMOUS_USERS:o.RATE_LIMIT_ANONYMOUS_USERS})},[b]),(0,r.jsxs)("div",{children:[(0,r.jsx)(x.ph,{title:"Rate Limits",description:"Safeguard against bursts of incoming traffic to prevent abuse and maximize stability",docsUrl:"https://supabase.com/docs/guides/platform/going-into-prod#rate-limiting-resource-allocation--abuse-prevention"}),g&&(0,r.jsx)(T.Z,{subject:"Failed to retrieve auth config rate limits",error:R}),A&&(0,r.jsx)(S.A,{}),b&&(0,r.jsx)(c.l0,{...F,children:(0,r.jsx)("form",{id:e,className:"space-y-4",onSubmit:F.handleSubmit(e=>{if(!n)return console.error("Project ref is required");let t={};["RATE_LIMIT_TOKEN_REFRESH","RATE_LIMIT_VERIFY","RATE_LIMIT_EMAIL_SENT","RATE_LIMIT_SMS_SENT","RATE_LIMIT_ANONYMOUS_USERS"].forEach(n=>{e[n]!==(null==o?void 0:o[n])&&(t[n]=e[n])}),v({projectRef:n,config:t},{onSuccess:()=>F.reset(e)})}),children:(0,r.jsxs)(x.by,{footer:(0,r.jsx)("div",{className:"flex py-4 px-8",children:(0,r.jsx)(x.iN,{form:e,isSubmitting:L,hasChanges:F.formState.isDirty,handleReset:()=>F.reset(),disabled:!t,helper:t?void 0:"You need additional permissions to update authentication settings"})}),children:[(0,r.jsx)(x.hj,{id:"email-sent",header:(0,r.jsx)(x.S0,{description:(0,r.jsx)("p",{className:"text-foreground-light text-sm",children:"Number of emails that can be sent per hour from your project"}),children:"Rate limit for sending emails"}),children:(0,r.jsx)(x.B4,{loading:!1,children:(0,r.jsx)(c.Wi,{control:F.control,name:"RATE_LIMIT_EMAIL_SENT",render:e=>{let{field:t}=e;return(0,r.jsxs)(c.xJ,{children:[(0,r.jsx)(c.NI,{children:(0,r.jsx)(h.I,{disabled:!P,type:"number",...t})}),o.EXTERNAL_EMAIL_ENABLED?(0,p.n)(o)?null:(0,r.jsxs)(_.bZ,{children:[(0,r.jsx)(f.aN,{}),(0,r.jsx)(_.Cd,{children:"Custom SMTP provider is required to update this configuration"}),(0,r.jsxs)(_.X,{className:"flex flex-col gap-y-3",children:[(0,r.jsx)("p",{className:"!leading-tight",children:"The built-in email service has a fixed rate limit. You will need to set up your own custom SMTP provider to update your email rate limit"}),(0,r.jsx)(E.z,{asChild:!0,type:"default",className:"w-min",children:(0,r.jsx)(a(),{href:"/project/".concat(n,"/settings/auth"),children:"View SMTP settings"})})]})]}):(0,r.jsxs)(_.bZ,{children:[(0,r.jsx)(f.aN,{}),(0,r.jsx)(_.Cd,{children:"Email-based logins are not enabled for your project"}),(0,r.jsxs)(_.X,{className:"flex flex-col gap-y-3",children:[(0,r.jsx)("p",{className:"!leading-tight",children:"Enable email-based logins to update this rate limit"}),(0,r.jsx)(E.z,{asChild:!0,type:"default",className:"w-min",children:(0,r.jsx)(a(),{href:"/project/".concat(n,"/auth/providers"),children:"View auth providers"})})]})]})]})}})})}),(0,r.jsx)(x.hj,{id:"sms-sent",header:(0,r.jsx)(x.S0,{description:(0,r.jsx)("p",{className:"text-foreground-light text-sm",children:"Number of SMS messages that can be sent per hour from your project"}),children:"Rate limit for sending SMS messages"}),children:(0,r.jsx)(x.B4,{loading:!1,children:(0,r.jsx)(c.Wi,{control:F.control,name:"RATE_LIMIT_SMS_SENT",render:e=>{let{field:t}=e;return(0,r.jsxs)(c.xJ,{children:[(0,r.jsx)(c.NI,{children:(0,r.jsx)(h.I,{disabled:!y,type:"number",...t})}),!y&&(0,r.jsxs)(_.bZ,{children:[(0,r.jsx)(f.aN,{}),(0,r.jsx)(_.Cd,{children:"Phone-based logins are not enabled for your project"}),(0,r.jsxs)(_.X,{className:"flex flex-col gap-y-3",children:[(0,r.jsx)("p",{className:"!leading-tight",children:"Enable phone-based logins to update this rate limit"}),(0,r.jsx)(E.z,{asChild:!0,type:"default",className:"w-min",children:(0,r.jsx)(a(),{href:"/project/".concat(n,"/auth/providers"),children:"View auth providers"})})]})]})]})}})})}),(0,r.jsx)(x.hj,{id:"token-refresh",header:(0,r.jsx)(x.S0,{description:(0,r.jsx)("p",{className:"text-foreground-light text-sm",children:"Number of sessions that can be refreshed in a 5 minute interval per IP address."}),children:"Rate limit for token refreshes"}),children:(0,r.jsx)(x.B4,{loading:!1,children:(0,r.jsx)(c.Wi,{control:F.control,name:"RATE_LIMIT_TOKEN_REFRESH",render:e=>{let{field:n}=e;return(0,r.jsxs)(c.xJ,{children:[(0,r.jsx)(c.NI,{children:(0,r.jsx)(h.I,{type:"number",...n})}),n.value>0&&(0,r.jsx)(r.Fragment,{children:(0,r.jsxs)("p",{className:"text-foreground-lighter text-sm",children:["This is equivalent to ",12*n.value," requests per hour"]})})]})}})})}),(0,r.jsx)(x.hj,{id:"verify",header:(0,r.jsx)(x.S0,{description:(0,r.jsx)("p",{className:"text-foreground-light text-sm",children:"Number of OTP/Magic link verifications that can be made in a 5 minute interval per IP address."}),children:"Rate limit for token verifications"}),children:(0,r.jsx)(x.B4,{loading:!1,children:(0,r.jsx)(c.Wi,{control:F.control,name:"RATE_LIMIT_VERIFY",render:e=>{let{field:n}=e;return(0,r.jsxs)(c.xJ,{children:[(0,r.jsx)(c.NI,{children:(0,r.jsx)(h.I,{type:"number",...n})}),n.value>0&&(0,r.jsxs)("p",{className:"text-foreground-lighter text-sm",children:["This is equivalent to ",12*n.value," requests per hour"]})]})}})})}),(0,r.jsx)(x.hj,{id:"anonymous-users",header:(0,r.jsx)(x.S0,{description:(0,r.jsx)("p",{className:"text-foreground-light text-sm",children:"Number of anonymous sign-ins that can be made per hour per IP address."}),children:"Rate limit for anonymous users"}),children:(0,r.jsx)(x.B4,{loading:!1,children:(0,r.jsx)(c.Wi,{control:F.control,name:"RATE_LIMIT_ANONYMOUS_USERS",render:e=>{let{field:t}=e;return(0,r.jsxs)(c.xJ,{children:[(0,r.jsx)(c.NI,{children:(0,r.jsx)(h.I,{disabled:!O,type:"number",...t})}),!O&&(0,r.jsxs)(_.bZ,{children:[(0,r.jsx)(f.aN,{}),(0,r.jsx)(_.Cd,{children:"Anonymous logins are not enabled for your project"}),(0,r.jsxs)(_.X,{className:"flex flex-col gap-y-3",children:[(0,r.jsx)("p",{className:"!leading-tight",children:"Enable anonymous logins to update this rate limit"}),(0,r.jsx)(E.z,{asChild:!0,type:"default",className:"w-min",children:(0,r.jsx)(a(),{href:"/project/".concat(n,"/settings/auth"),children:"View auth settings"})})]})]})]})}})})})]})})})]})},A=t(92099),g=t(14782);let b=()=>{let e=(0,I.Xo)(s.KA.READ,"custom_config_gotrue");return(0,I.N4)()&&!e?(0,r.jsx)(g.Z,{isFullPage:!0,resourceText:"access your project's auth rate limit settings"}):(0,r.jsx)(x.ld,{children:(0,r.jsx)(R,{})})};b.getLayout=e=>(0,r.jsx)(A.g1,{children:e});var v=b}},function(e){e.O(0,[667,9678,8183,8421,3844,9785,7263,2745,9595,4582,5573,7932,9806,1682,7309,9229,3832,626,7774,6541,8020,6723,9774,2888,179],function(){return e(e.s=29345)}),_N_E=e.O()}]);