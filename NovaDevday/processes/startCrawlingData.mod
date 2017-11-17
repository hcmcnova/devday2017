[Ivy]
15FBF01D998D2EFC 3.20 #module
>Proto >Proto Collection #zClass
sa0 startCrawlingData Big #zClass
sa0 B #cInfo
sa0 #process
sa0 @TextInP .resExport .resExport #zField
sa0 @TextInP .type .type #zField
sa0 @TextInP .processKind .processKind #zField
sa0 @AnnotationInP-0n ai ai #zField
sa0 @MessageFlowInP-0n messageIn messageIn #zField
sa0 @MessageFlowOutP-0n messageOut messageOut #zField
sa0 @TextInP .xml .xml #zField
sa0 @TextInP .responsibility .responsibility #zField
sa0 @StartRequest f0 '' #zField
sa0 @EndTask f1 '' #zField
sa0 @GridStep f3 '' #zField
sa0 @PushWFArc f4 '' #zField
sa0 @StartEvent f5 '' #zField
sa0 @Alternative f8 '' #zField
sa0 @PushWFArc f10 '' #zField
sa0 @PushWFArc f6 '' #zField
sa0 @PushWFArc f7 '' #zField
sa0 @EMail f2 '' #zField
sa0 @PushWFArc f11 '' #zField
sa0 @GridStep f12 '' #zField
sa0 @PushWFArc f13 '' #zField
sa0 @PushWFArc f9 '' #zField
>Proto sa0 sa0 startCrawlingData #zField
sa0 f0 outLink start.ivp #txt
sa0 f0 type com.nova.devday.Data #txt
sa0 f0 inParamDecl '<> param;' #txt
sa0 f0 actionDecl 'com.nova.devday.Data out;
' #txt
sa0 f0 guid 15FBF01D9DF5B35B #txt
sa0 f0 requestEnabled true #txt
sa0 f0 triggerEnabled false #txt
sa0 f0 callSignature start() #txt
sa0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start.ivp</name>
    </language>
</elementInfo>
' #txt
sa0 f0 @C|.responsibility Everybody #txt
sa0 f0 81 49 30 30 -21 17 #rect
sa0 f0 @|StartRequestIcon #fIcon
sa0 f1 type com.nova.devday.Data #txt
sa0 f1 977 49 30 30 0 15 #rect
sa0 f1 @|EndIcon #fIcon
sa0 f3 actionDecl 'com.nova.devday.Data out;
' #txt
sa0 f3 actionTable 'out=in;
' #txt
sa0 f3 actionCode 'import nova.devday.CrawlingService;
CrawlingService crawlingService = new CrawlingService();
crawlingService.crawlData();' #txt
sa0 f3 type com.nova.devday.Data #txt
sa0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Crawling Data</name>
        <nameStyle>13,7
</nameStyle>
    </language>
</elementInfo>
' #txt
sa0 f3 360 42 112 44 -39 -8 #rect
sa0 f3 @|StepIcon #fIcon
sa0 f4 expr out #txt
sa0 f4 111 64 360 64 #arcP
sa0 f5 outerBean "ch.ivyteam.ivy.process.eventstart.beans.AutoProcessStarterEventBean" #txt
sa0 f5 beanConfig "3600" #txt
sa0 f5 outLink eventLink.ivp #txt
sa0 f5 type com.nova.devday.Data #txt
sa0 f5 @C|.responsibility Everybody #txt
sa0 f5 81 209 30 30 0 15 #rect
sa0 f5 @|StartEventIcon #fIcon
sa0 f8 type com.nova.devday.Data #txt
sa0 f8 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Time To Run Crawling Data?</name>
        <nameStyle>26,7
</nameStyle>
    </language>
</elementInfo>
' #txt
sa0 f8 400 208 32 32 -68 19 #rect
sa0 f8 @|AlternativeIcon #fIcon
sa0 f10 expr in #txt
sa0 f10 outCond nova.devday.CronJobService.createInstance().checkToRunCrawlingData() #txt
sa0 f10 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Yes</name>
        <nameStyle>3,7
</nameStyle>
    </language>
</elementInfo>
' #txt
sa0 f10 416 208 416 86 #arcP
sa0 f10 0 0.5 -15 0 #arcLabel
sa0 f6 expr out #txt
sa0 f6 111 224 400 224 #arcP
sa0 f7 expr in #txt
sa0 f7 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>No</name>
        <nameStyle>2,7
</nameStyle>
    </language>
</elementInfo>
' #txt
sa0 f7 429 221 977 68 #arcP
sa0 f7 0 0.4437803002277993 -2 -10 #arcLabel
sa0 f2 beanConfig '"{/emailSubject ""<%=in.email.subject%>""/emailFrom ""<%=in.email.from%>""/emailReplyTo """"/emailTo ""<%=in.email.to%>""/emailCC """"/emailBCC """"/exceptionMissingEmailAttachments ""false""/emailMessage ""<%=in.email.content%>""/emailAttachments * }"' #txt
sa0 f2 type com.nova.devday.Data #txt
sa0 f2 timeout 0 #txt
sa0 f2 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Send Email</name>
        <nameStyle>10,7
</nameStyle>
    </language>
</elementInfo>
' #txt
sa0 f2 680 42 112 44 -32 -8 #rect
sa0 f2 @|EMailIcon #fIcon
sa0 f11 expr out #txt
sa0 f11 792 64 977 64 #arcP
sa0 f12 actionDecl 'com.nova.devday.Data out;
' #txt
sa0 f12 actionTable 'out=in;
' #txt
sa0 f12 actionCode 'import nova.devday.MailSenderService;
 MailSenderService mailSenderService = new MailSenderService();
mailSenderService.buildEmailObject();' #txt
sa0 f12 type com.nova.devday.Data #txt
sa0 f12 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Init Email</name>
        <nameStyle>10,7
</nameStyle>
    </language>
</elementInfo>
' #txt
sa0 f12 520 42 112 44 -25 -8 #rect
sa0 f12 @|StepIcon #fIcon
sa0 f13 expr out #txt
sa0 f13 472 64 520 64 #arcP
sa0 f9 expr out #txt
sa0 f9 632 64 680 64 #arcP
>Proto sa0 .type com.nova.devday.Data #txt
>Proto sa0 .processKind NORMAL #txt
>Proto sa0 0 0 32 24 18 0 #rect
>Proto sa0 @|BIcon #fIcon
sa0 f0 mainOut f4 tail #connect
sa0 f4 head f3 mainIn #connect
sa0 f8 out f10 tail #connect
sa0 f10 head f3 mainIn #connect
sa0 f5 mainOut f6 tail #connect
sa0 f6 head f8 in #connect
sa0 f8 out f7 tail #connect
sa0 f7 head f1 mainIn #connect
sa0 f2 mainOut f11 tail #connect
sa0 f11 head f1 mainIn #connect
sa0 f3 mainOut f13 tail #connect
sa0 f13 head f12 mainIn #connect
sa0 f12 mainOut f9 tail #connect
sa0 f9 head f2 mainIn #connect
