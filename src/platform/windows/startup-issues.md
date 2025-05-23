# مشاكل البدء في ويندوز {#windows-startup-issues}

<!-- toc -->

## تحديثات ويندوز {#windows-updates}

عند بدء أنكي، قد ترى رسالة مثل التالي:

- _Error loading Python DLL_
- _The program can't start because api-ms-win.... is missing_
- _Failed to execute script runanki_
- _Failed to execute script pyi_rth_multiprocessing_
- _Failed to execute script pyi_rth_win32comgenpy_

يكون سبب هذه الأخطاء عادةً تحديثات ويندوز أو مكتبة ويندوز ناقصة.

افتح نافذة تحديثات ويندوز وتأكد من أن كل التحديثات منصبة.
إذا كان هناك أي تحديثات، أعد تشغيل حاسوبك بعد التنصيب.

## ويندوز 7/8 {#windows-78}

في ويندوز 7/8، قد تحتاج إلى تنصيب تحديثات إضافية يدويًا. جرب تنصيب:

- <https://www.microsoft.com/en-us/download/details.aspx?id=48234>
- <https://aka.ms/vs/15/release/vc_redist.x64.exe>
- <http://www.catalog.update.microsoft.com/Search.aspx?q=kb4474419>
- <http://www.catalog.update.microsoft.com/Search.aspx?q=kb4490628>

## مشاكل تعريف الفيديو {#video-driver-issues}

انظر [مشاكل العرض](./display-issues.md).

## شاشات متعددة {#multiple-displays}

إذا واجهت رسالة خطأ _LoadLibrary failed with error 126_، فقد يكون هذا بسبب أن
مكتبة الواجهات التي بني عليها أنكي فيها مشاكل متعلقة
[بالشاشات المتعددة](https://forums.ankiweb.net/t/error-126-on-open-anki-desktop/13967).

## برامج مكافحة الفيروسات/جدار الحماية {#antivirusfirewall-software}

قد تمنع برامج الطرف الثالث على حاسوبك أنكي من العمل. تستطيع إضافة استثناء لأنكي،
أو إيقاف برنامج الحماية مؤقتًا لكي ترى إذا كان هذا يحل المشكلة.

## وصول المسؤول {#admin-access}

أخبر بعض المستخدمين أن أنكي لا يعمل عندهم إلا إذا نقروا بزر الفأرة الأيمن على أيقونة
أنكي وضغطوا "تشغيل كمسؤول". يخزن أنكي كل بياناته في مجلد مستخدمك، ولا يجب أن يحتاج
لأذونات المسؤول، لكن هذا حل يمكنك تجريبه إذا جربت كل الحلول الأخرى.

## نسخ أنكي متعددة موجودة بعد التحديث {#multiple-anki-installations-present-after-updating}

إذا انتهت بك عملية التحديث بأن يصبح لديك نسخ أنكي متعددة (موجودة في `C:\Program Files\Anki`
و `C:\Program Files (x86)\Anki` مثلًا)، فقد تكون معطوبة، وقد يرفض أنكي أن يبدأ بدون إظهار رسالة خطأ.

جرب حذف كل النسخ - قد يمكنك فعل هذا من خلال قائمة إعدادات `البرامج والميزات` في ويندوز،
أو بتشغيل أمر `uninstall.exe` في كل مجلد لأنكي. نصب أنكي مجددًا بعد ذلك.

## إصلاح الأخطاء {#debugging}

تشغيل أنكي من الطرفية قد يكشف عن مزيد من المعلومات حول بعض الأخطاء.
بعد تنصيب آخر إصدار من أنكي والتأكد من تنصيب كل تحديثات ويندوز، بدلًا من تشغيل
أنكي بشكل مباشر، افتح قائمة ابدأ>تشغيل وأدخل cmd.exe. عندما تظهر نافذة الطرفية، أدخل

```bat
cd \program files\anki & anki-console
```

من المفترض أن يفشل أنكي بالبدء كما من قبل، لكنه قد يكشف شيئًا حول ما يسبب المشكلة.

## إذا فشل كل شيء آخر {#if-all-else-fails}

إذا لم تكن قادرًا على تشغيل أنكي بعد تجربة الحلول السابقة، لديك خياران متبقيان:

- تستطيع تجربة [التشغيل من بايثون](https://faqs.ankiweb.net/running-from-python.html).
- تستطيع تجربة إصدار أنكي أقدم مبني بمكتبة واجهات أقدم، مثل 2.1.35-alternate, و 2.1.15.
