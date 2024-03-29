//
//  Sociotypes.swift
//  Synergy
//
//  Created by Артур Кулик on 23.10.2023.
//

import Foundation

var socioTypesMock: [SociotypeModel] = []

enum SociotypeFactory: CaseIterable {
    case donQuixote
    case dumas
    case hugo
    case robespierre
    
    var type: SociotypeModel {
        switch self {
        case .donQuixote:
            return SociotypeList.donQuixot
        case .dumas:
            return SociotypeList.dumas
        case .hugo:
            return SociotypeList.hugo
        case .robespierre:
            return SociotypeList.robespierre
        }
    }
}

enum SociotypeList {
    
    // MARK: Дон Кихот
    static let donQuixot = SociotypeModel(
        socioShortName: "ИЛЭ",
        socioName: "Интуитивно - Логический Экстраверт",
        socioNickname: "Дон Кихот",
        imbtName: "ENTP",
        imbtNickName: "Искатель",
        raininSigns: [.extravert, .irrationals, .democratic, .yielding, .carefree, .constructivism, .tactic, .static, .positivism, .process, .gaiety, .decisive, .asking],
        description: SociotypeDescriptionModel(
            general: " Хорошо видит далекие перспективы. Большой выдумщик: у него всегда много новых идей и проектов. Интересуется всем подряд в надежде отыскать что-то уникальное. К прошлым достижениям относится пренебрежительно. Занимается тем, что ему интересно, а не тем, что гарантирует реальную отдачу.",
            modelA: [
                .init(position: .leading, function: .blackIntuition, description: "Дон Кихот – человек с хорошей фантазией, увлекающийся разными идеями, вдохновляющий ими других. Безучастность окружающих к его идеям воспринимается болезненно. Речь Дон Кихота пестрит абстрактными образами. В работе его больше мотивирует реализация себя как уникальной личности. Дон Кихот обладает интересом к малоизвестному, поэтому порой вместо того, чтобы остановиться на проверенном, как новатор придумывает новое, не всегда соответствующее реальности. Круг интересов ИЛЭ очень широк. Дон Кихот демократичен, для него характерно ощущение внутренней свободы и независимости."),
                .init(position: .creative, function: .whiteLogic, description: "Умение мыслить – творчество Дон Кихота. Он предпочитает до всего додумываться своим умом. Обладает научным складом ума. Интеллектуальным развлечением ИЛЭ является полемика (поэтому психотип в mbti называют Полемист). Критикует других людей за нелогичность. Логика этого социотипа гибкая, подвижная и неуязвимая (контактная и сильная функция). Даже невероятную идею Дон Кихот может развить в логически выстроенную теорию. Ему хорошо даётся функциональный анализ. Ум ИЛЭ гибок и быстр, он находит оригинальные аргументы, часто опережая доводы оппонентов."),
                .init(position: .role, function: .blackSensorics, description: "Дон Кихота раздражают жёсткие требования со стороны окружающих. Как настоящий демократ, он не любит проявления собственнических качеств к нему. Однако, постоять за себя он может, особенно когда нужно отстоять своё интеллектуальное творчество. Может показать себя сильной личностью, а чаще просто похвастаться проявлением волевых качеств, которые у него выражены весьма нормативно."),
                .init(position: .vulnerable, function: .whiteEthics, description: "Область чувств и отношений - слабая сторона. Его отношения с окружающими (особенно в негармоничных интертипных отношениях) складывают непросто. Высказываясь открыто, может задеть чьи-то чувства. К вопросам этики Дон Кихот подходит логически. Ему проще помочь своими объяснениями и действиями, чем эмпатией. Дон Кихоту не присущ традиционализм. Его раздражает морализаторство."),
                .init(position: .suggestive, function: .whiteSensorics, description: "Дон Кихот подсознательно стремится к восприятию приятных ощущений, обсуждению их. При этом, проявляет неуверенность в оценке физических качеств предметов. Неприятные ощущения и дискомфорт делают его агрессивным. Обязанности по заботе о детях часто возлагают на своих супругов."),
                .init(position: .mobilizing, function: .blackEthics, description: "Настроение Дон Кихота очень сильно реагирует на внешние факторы. Если он не поел или попал в некомфортную для себя компанию, он становится подавленным или раздражительным. Если он окружен уютом и позитивными эмоциями, у него появляется уверенность в себе, он начинает шутить и веселиться. Когда у него получается кого-то развеселить, самооценка повышается. Жизнь иррационального Дон Кихота – это эмоциональные подъёмы и спады"),
                .init(position: .restrictive, function: .whiteIntuition, description: "Дон Кихот не любит, когда его временем распоряжаются как своим. При этом, сам склонен больше не к планированию времени, а к действиям по ситуации. Иногда может забыть сделать обещанное к назначенному сроку. Обладает тактическим мышлением. Предсказания, основанные на мистике, игнорирует."),
                .init(position: .background, function: .blackLogic, description: "Дон Кихоты – активные люди, имеющие представление о том, как делается та или иная работа, имеют большой потенциал в бизнесе, однако профессиональную дисциплину они могут игнорировать. Не желают действовать по образцу просто потому, что это установленный образ действий. Находят решения в работе в самых нестандартных ситуациях. Если работа становится скучной для них, теряют интерес и делают её спустя рукава."),
            ],
            popularPersons: []
        )
    )
    
    
    // MARK: Дюма
    static let dumas = SociotypeModel(
        socioShortName: "СЭИ",
        socioName: "Сэнсорно - Этический Интроверт",
        socioNickname: "Дюма",
        imbtName: "ISFP",
        imbtNickName: "Посредник",
        raininSigns: [.introvert, .irrationals, .democratic, .yielding, .carefree, .emotivism, .stragetic, .dynamic, .negativism, .process, .gaiety, .decisive, .declaring],
        description: SociotypeDescriptionModel(
            general: "Всегда дружелюбный и приятный в общении. Очень считается со своими удобствами и комфортом других. По отношению к своим близким внимателен и заботлив. В коллективе занимает позицию «золотой середины». Любит красивые вещи и домашнюю обстановку.",
            modelA: [
                .init(position: .leading, function: .whiteSensorics, description: "Гармония, физический комфорт и удовольствия от жизни - основа восприятия мира представителями социотипа Дюма. Речь СЭИ наполнена выражением своих ощущений. Дюма способен синтезировать тонкие оттенки цвета, тона, текстуры, аромата и вкуса. Он направлен на созидание прекрасного в разных формах проявления. Для него важно ощущать вкус жизни. Удовольствие Дюма любит как получать, так и дарить. Умеет воссоздавать заново пережитые им ощущения. Отсутствие комфорта беспокоит Дюма. СЭИ критикует неудобно организованные условия работы, подмечает неудобства. Дюма одевает только комфортную для тела одежду, но эстетика для него также имеет значение. Нравится делать все то, что обусловлено его ощущениями (визуальными - фото, рисование, аудиальными - музыка, тактильными - работа и отдых на природе и др.). Среди Дюма часто встречаются люди искусства. Они могут увлечься разным ручным творчеством и заниматься им всю жизнь."),
                .init(position: .creative, function: .blackEthics, description: "Начинает общение с улыбки. Обладает хорошей мимикой. Постоянно говорит о разнообразных эмоциях, демонстрирует приоритетно положительное настроение. Общества скучных, циничных людей избегает. Хорошо умеет развеселить как взрослого, так и ребёнка. Самый коммуникабельный интроверт."),
                .init(position: .role, function: .whiteIntuition, description: "Периодически уходит в прошлое, рассказывает про школу и прочие периоды жизни, упоминает время в речи. При этом путается во времени. При первой встрече хочет показать себя пунктуальным человеком, но в целом не отличается пунктуальностью. Прогнозы часто носят наивный характер. У Дюма отторжение от людей, которые живут по выверенному плану и вечно торопятся. Наслаждается каждой минутой жизни."),
                .init(position: .vulnerable, function: .blackLogic, description: "СЭИ не хватает планомерности действий. Он действует на импульсе. Работа, не связанная с ощущениями или творчеством, для Дюма – обременительная необходимость. Чтобы быть счастливым и самодостаточным, ему необходимо иметь возможность свободно планировать свои действия и получать поощрение за их выполнение. Критика своей работы воспринимается болезненно. Не любит контроля в процессе работы, при этом разобраться в технологиях бизнеса без внешней помощи ему сложно."),
                .init(position: .suggestive, function: .blackIntuition, description: "Любит путешествия и импровизацию в жизни. Демократичен. Важное значение имеет раскрытие своих разнообразных талантов. Понимание предпринимательских возможностей находится на низком уровне. СЭИ привлекают необычные люди, генерирующие оригинальные идеи."),
                .init(position: .mobilizing, function: .whiteLogic, description: "Для Дюма очень важно, чтобы его партнёр обладал сильным логическим мышлением. Выполнять арифметические расчёты людям этого типа сложно, однако, логические неувязки они могут подмечать. Интересен анализ информации."),
                .init(position: .restrictive, function: .blackSensorics, description: "Открытого волевого давление не оказывает, хотя может это сделать в критичной ситуации. Ситуации противостояния нарушают его смысловую гармонию. Жесткую конкуренцию избегает. Знает на что обращают внимание люди противоположного пола и умеет подчеркнуть свои достоинства. Способен поставить рамки нежелательным для себя людям. Критичен к проявлению волевого нажима в свою сторону."),
                .init(position: .background, function: .whiteEthics, description: "Говорит об отношениях, кто ему понравился, кто нет, выражает своё отношение, проявляет душевный стиль общения. Окружающие, как правило, ценят душевность Дюма. Его не особо волнует тема морали. Дипломатичен и уступчив, отзывчив к боли и страданиям других.")
            ],
            popularPersons: []
        )
    )
    
    // MARK: Гюго
    static let hugo = SociotypeModel(
        socioShortName: "ЭСЭ",
        socioName: "Этико - Сенсорный Экстраверт",
        socioNickname: "Гюго",
        imbtName: "ESFJ",
        imbtNickName: "Энтузиаст",
        raininSigns: [.extravert, .rationals, .democratic, .obstinate, .farsighted, .constructivism, .tactic, .dynamic, .positivism, .result, .gaiety, .decisive, .declaring],
        description: SociotypeDescriptionModel(
            general: "Эмоционален и общителен. Умеет поднять настроение, развеселить. С удовольствием рассказывает о своих связях, знакомствах. Эмоции меняются резко: то весел и дружелюбен, то вспыльчив и зол. Следит за манерами и корректностью поведения окружающих. Заботлив и гостеприимен. Умеет создать уют из того, что есть под руками. Очень следит за самочувствием и здоровьем своим и своих близких. Любит делать подарки, доставлять людям приятное. Прекрасный организатор отдыха и торжественных мероприятий. С трудом сдерживает свои эмоции. К людям, которые ему не нравятся, относится придирчиво. Очень обижается, если его старания не ценятся. Довольно суетлив и разбросан. Постоянно перегружен делами, от многих из которых можно отказаться. Плохо предчувствует жизненные потрясения и драматические события. Ожидает только положительного результата, поэтому часто подвержен стрессу несбывшихся надежд. Устойчив в привычках и способах времяпрепровождения. Переоценивая запас времени, не успевает выполнить все, что запланировано. За необходимую работу часто берется в последнюю минуту, чем обрекает себя на губительную спешку.",
            modelA: [
                .init(position: .leading, function: .blackEthics, description: "Эмоции – это неотъемлемая часть жизни Гюго, что находит отражение в стиле общения этого социотипа. В речи ЭСЭ слышны гиперболы – преувеличения с целью усиления выразительности, заметны постоянные изменения интонации. Базовая экстравертная этика не может не оценивать и эмоции других людей. Гюго не сдерживают свои эмоции. В палитре эмоций преобладают позитивные. Радуется Гюго ярко. Негативные же эмоции на публике он редко демонстрирует, близким же иногда достаётся. Гюго как представитель весёлой квадры не только в себе, но и в других людях поддерживает проявление эмоций и не понимает тех, для кого эмоции не в ценностях."),
                .init(position: .creative, function: .whiteSensorics, description: "Для Гюго очень важны ощущения. Это тактильные люди: гладят близких, вдыхают запах волос, обнимают, в частности в общественных местах. Обожают вкусную еду, но в разумных пределах. Они, как сенсорные рационалы, следят за режимом питания и отдыха. Отдыхать Гюго умеют, как пассивно, так и активно. Слушая музыку, наслаждаются мелодией, гармонией, любят танцевать под нее, чувствовать свое тело и такт музыки. Рисуют Гюго тоже хорошо, особенно если прокачали этот навык. Это заботливые люди. Они следят за здоровьем близких и критичны к ним, в случае наплевательского отношения к своему телу."),
                .init(position: .role, function: .blackLogic, description: "Гюго любят играть деловую персону, нагружать себя разными делами. Вопросы заработка и расширения деятельности волнуют Гюго. Они осваивают нужные им технологии. ЭСЭ с энтузиазмом загораются новым делом, однако, очень легко этот пыл остывает. Глубокие вопросы бизнеса даются Гюго непросто. Это им не особо интересно. Быстро выдыхаются, когда просят объяснить как та или иная вещь работает. Многие поступки у Гюго подчинены эмоциям, а не прагматизму. Значительная доля финансовых средств тратится на удовольствия и развлечения."),
                .init(position: .vulnerable, function: .whiteIntuition, description: "Гюго жалуются на отсутствие времени. Испытывают постоянную его нехватку. Переживают за будущее. Плохо чувствуют время, им сложно жить без часов. ЭСЭ настроены во всём на позитив, поэтому его очень утомляют негативные прогнозы, тема тлена. Они очень не любят опаздывать и при этом вполне могут опаздывать из-за неумения рассчитать время. Уязвимы к критике своей пунктуальности."),
                .init(position: .suggestive, function: .whiteLogic, description: "Гюго восхищает интеллект, структурированность и дисциплина в других людях. Они спокойно и уверенно себя чувствуют, когда вокруг стабильность. ЭСЭ любят учиться, усваивать теории и концепции. Однако, обучение Гюго успешно только в случае применения в нём системного подхода. Сам Гюго старается рассуждать логично, однако это получается не всегда. Ещё сложнее для Гюго подавать информацию в хладнокровной форме."),
                .init(position: .mobilizing, function: .blackIntuition, description: "Гюго охотно поддерживают новые возможности и проекты. Их активизирует фантазия в людях. Интересуют различные варианты деятельности. Важно показать себя как уникальная, интересная личность. Женщины-Гюго проявляют креатив, как правило, в макияже и одежде, мужчины-Гюго – в основном в работе. Идеи Гюго чаще всего касаются организации каких-либо мероприятий. Особенно хороши в организации праздников."),
                .init(position: .restrictive, function: .whiteEthics, description: "Гюго наблюдают за проявлением чувств других людей и за своими отношениям. Стремятся выстраивать постоянные романтические отношения, а не мимолетные увлечения. Однако, если партнёр не поддерживает эмоции Гюго, он уходит к другому, потому что ему хочется, чтобы отношения были яркими. Говорить об утешении, моральных нормах не интересно. Но иногда почитать мораль может, осуждает грубость в отношениях. Гюго, как правило, не очень словоохотливы относительно своей прошлой личной жизни."),
                .init(position: .background, function: .blackSensorics, description: "Гюго – сильные личности и достигаторы, часто занимаются спортом. Это настойчивые, упрямые, напористые люди. Им важен статус и престиж, но редко в этом признаются. Порой играют в просточка, таким не являясь. Волевой нажим для Гюго – это инструмент защиты личных интересов. Внешняя презентабельность Гюго – ресурс в первую очередь для того, чтобы вызвать эмоции в других людях, создать впечатление о себе."),
            ],
            popularPersons: []
    )
)
    
    // MARK: Робеспьер
    static let robespierre = SociotypeModel(
        socioShortName: "ЛИИ",
        socioName: "Логико - Интуитивный Интроверт",
        socioNickname: "Робеспьер",
        imbtName: "INTJ",
        imbtNickName: "Аналитик",
        raininSigns: [.introvert, .rationals, .democratic, .obstinate, .farsighted, .emotivism, .stragetic, .static, .negativism, .result, .gaiety, .decisive, .asking],
        description: .init(
            general: "1. Обладает развитой логикой и способностью к анализу. Умеет четко отделить главное от второстепенного. Структуры, классификации, концепции — его стиль. Объективен и резок в суждениях и принципиальных оценках. Не устраивающие его правила или указания игнорирует. Разобравшись в проблеме, выдвигает принципиально новые решения. Терпим к другим точкам зрения и стилям жизни. Его поведение часто непонятно окружающим, так как многие решения он принимает интуитивно — по догадке. Часто имеет какое-либо увлечение, в котором постоянно совершенствуется. Беседу поддерживает только тогда, когда она касается значимых для него тем. Плохо разбирается в чувствах людей. Упрям и негибок в отношениях. Скрытен, очень не любит непрошеных гостей, не умеет их занять. Осторожен в общении, часто держится на дистанции. Чем больше симпатизирует человеку внутренне, тем меньше демонстрирует свою заинтересованность внешне. Упорно сохраняет ту систему отношений, к которой привык. В быту скромен, согласен довольствоваться минимумом удобств. Повседневные домашние обязанности его угнетают. Несмотря на упрямство плохо развиты пробивные способности. Не умеет подчинять людей. В критических ситуациях довольно нерешителен. От него ничего не добьешься принуждением.",
            modelA: [
                .init(position: .leading, function: .whiteLogic, description: "Робеспьер считает, что все в мире должно быть логично и справедливо. Он дисциплинирован и последователен. Умеет логично излагать свои мысли, доказывать свою правоту, аргументируя её разумными доводами. Робеспьер обладает способностью к аналитическому мышлению. Любит рассуждать о различных науках, системах, моделях, структурах, схемах, классификациях. В любых явлениях ищет и находит первопричины противоречий и нелогичностей. Нравится раскладывать явление по полочкам. Стремится к логической гармонии и порядку. Робеспьер обычно принципиален в своих суждениях. Уверен, что разумное не может быть плохим. Негативно относится к тем, кто не воспринимает в серьёз его систему взглядов. ЛИИ — специалист не столько по расширению человеческих знаний, сколько по их углублению. Робеспьер, который занял руководящую должность, склонен соблюдать формальности и требовать того же от других. Повышенные требования к другим обычно предъявляет только тогда, когда сам им соответствует. Высоко развито чувство справедливости. Надёжность, стабильность, последовательность, спокойствие, постоянство – те качества, которые неизменны в ЛИИ. Он придерживается своих индивидуальных принципов. Робеспьеры склонны использовать в своей речь научную и специфическую терминологию, которая может быть не всегда понятна обывателю."),
                .init(position: .creative, function: .blackIntuition, description: "ЛИИ постоянно находится в поиске новой информации, обращает внимание на достоверность её источников. Если нужно узнать что-либо важное, то предпочитает не расспрашивать знакомых и родственников, а зайти в Интернет, обратиться к справочнику, книге, нормативному документу. Принимая для себя какую-либо идею, ЛИИ становится ее последовательным сторонником и подчиняет ей свои мысли и действия. С общественным мнением в такой ситуации он может и не считаться. ЛИИ – «учёные-экспериментаторы». Их мотивирует личный интерес. Робеспьеры способны генерировать идеи и образы. ЛИИ считают, что мир полон новых открытий и впечатлений, поэтому склонны путешествовать. Приезжая в ту или иную страну, им всегда важно взглянуть на неё с неожиданной стороны. Тема свободы является одной из ведущих у ЛИИ. Она не ограничивается ни этическими догмами, ни силой. В речи Робеспьера много метафор."),
                .init(position: .role, function: .whiteEthics, description: "Робеспьер знает, что в обществе нужно быть этичным, вежливым, отзывчивым, однако, отнюдь не все ЛИИ придерживаются этих шаблонов. Других людей Робеспьер не морализирует. Ему, как интроверту, сложно проявлять инициативу в общении с незнакомыми людьми, а налаженные отношения рвать также тяжело. Часто люди этого социотипа начинают общение с улыбки, особенно девушки. Однако, для того, чтобы вести себя приветливо более длительное время, ЛИИ нужно делать над собой усилие. Уговаривать и просить — не любит. Этические житейские ситуации также рассматривает с точки зрения логики. Общение с книгой для него чаще предпочтительнее, чем общение с друзьями."),
                .init(position: .vulnerable, function: .blackSensorics, description: "Робеспьер болезненно относится к проявлению волевого нажима в свою сторону. Силовое давление он игнорирует. ЛИИ не обладает пробивной силой. Он не из тех людей, что открывают кабинеты с ноги. Робеспьеры, как настоящие демократы, склонны критиковать злоупотребление властью. При этом, руководить большим количеством людей ЛИИ сложно. Отстаивание интересов своих подчинённых руководителем-Робеспьером перед более высоким начальством отнимает у него очень много энергии. Занимаясь бизнесом, не склонен контролировать своих конкурентов."),
                .init(position: .suggestive, function: .blackEthics, description: "При хладнокровном стиле общения, подсознательный интерес у Робеспьера вызывает проявление открытых эмоций. Иногда может провоцировать на эмоции другого человека, сам того не осознавая. Он рассчитан на позитив. Если рядом с ним находится человек, воодушевляющий ЛИИ положительными эмоциями, он раскрепощается и продуктивность его работы повышается. Робеспьер, как представитель 1 квадры, считает, что общаться и шутить можно на все темы."),
                .init(position: .mobilizing, function: .whiteSensorics, description: "Сфера ощущений очень ценна для Робеспьера, от своего партнёра он подсознательно хочет получать физическую заботу. Поддерживает разговор на тему еды. Женщины могут хвастаться тем, как хорошо у них вышло то или иное блюдо. Однако, в реальности ЛИИ раздражает необходимость заниматься организацией быта. Эту сферу Робеспьер считает второстепенной."),
                .init(position: .restrictive, function: .blackLogic, description: "Демократичен в деловых отношениях. На работе уделяет внимание соблюдению прав человека, трудовому кодексу. Робеспьер-подчинённый не любит, когда ему дают выполнять несколько дел параллельно. Робеспьер-руководитель обязательно уделяет внимание раскрытию творческого потенциала подчинённых, их идеям. Дела доводит до конца, но часто растягивает срок их выполнения. Берёт ровно столько работы, сколько вписывается в его график. Склонен экономить деньги, копить на путешествия."),
                .init(position: .background, function: .whiteIntuition, description: "Робеспьер демонстрирует уверенность во времени. Отличается пунктуальностью и стратегическим мышлением. Однако, редко об этом говорит. У ЛИИ, как правило, субъективное и глубокое понимание истории. Предусмотрителен в планировании времени. Выполняет работу без суеты. Но, работая не спеша, успевает сделать много. Для ЛИИ очень важно наличие свободного времени в досуге. Склонен тратить его на самообразование, чтение интеллектуальной литературы."),
            ],
            popularPersons: [
                Theme.Socionics.Photos.Robespierres.irina_khakamada,
                Theme.Socionics.Photos.Robespierres.immanuel_kant,
                Theme.Socionics.Photos.Robespierres.mads_mikkelsen,
                Theme.Socionics.Photos.Robespierres.robert_oppenheimer,
                Theme.Socionics.Photos.Robespierres.maria_curie,
                Theme.Socionics.Photos.Robespierres.nikola_tesla,
                Theme.Socionics.Photos.Robespierres.vladimir_putin,
                Theme.Socionics.Photos.Robespierres.ludvig_van_bethoven
            ]
        )
    )
}
