require 'htree/regexp-util'

module HTree
  module Pat
    Name = /[A-Za-z_:][-A-Za-z0-9._:]*/

    DocType = /<!DOCTYPE.*?>/m
    ProcIns = /<\?.*?>/m
    Comment_C = /<!--(.*?)-->/m
    Comment = Comment_C.disable_capture
    CDATA_C = /<!\[CDATA\[(.*?)\]\]>/m
    CDATA = CDATA_C.disable_capture

    ValidAttr_C = /(#{Name})(\s*=\s*(?:"([^"]*)"|'([^']*)'|([-A-Za-z._:]*)))?/
    ValidAttr = ValidAttr_C.disable_capture
    InvalidAttr1_C = /(#{Name})(\s*=\s*(?:'([^'<>]*)'|"([^"<>]*)"|([^\s<>"']*)))?/
    InvalidAttr1 = InvalidAttr1_C.disable_capture
    InvalidAttr1End_C = /(#{Name})(\s*=\s*(?:'([^'<>]*)|"([^"<>]*)))/
    InvalidAttr1End = InvalidAttr1End_C.disable_capture

    ValidStartTag_C = /<(#{Name})((?:\s+#{ValidAttr})*)\s*>/
    ValidStartTag = ValidStartTag_C.disable_capture
    InvalidStartTag_C = /<(#{Name})((?:(?:\b|\s+)#{InvalidAttr1})*)((?:\b|\s+)#{InvalidAttr1End})?\s*>/
    InvalidStartTag = InvalidStartTag_C.disable_capture
    StartTag = /#{ValidStartTag}|#{InvalidStartTag}/

    ValidEmptyTag_C = %r{<(#{Name})((?:\s+#{ValidAttr})*)\s*/>}
    ValidEmptyTag = ValidEmptyTag_C.disable_capture
    InvalidEmptyTag_C = %r{<(#{Name})((?:(?:\b|\s+)#{InvalidAttr1})*)((?:\b|\s+)#{InvalidAttr1End})?\s*/>}
    InvalidEmptyTag = InvalidEmptyTag_C.disable_capture
    EmptyTag = /#{ValidEmptyTag}|#{InvalidEmptyTag}/

    EndTag_C = %r{</(#{Name})\s*>}
    EndTag = EndTag_C.disable_capture

    XmlVersionNum = /[a-zA-Z0-9_.:-]+/
    XmlVersionInfo = /\s+version\s*=\s*(?:'#{XmlVersionNum}'|"#{XmlVersionNum}")/
    XmlEncName = /[A-Za-z][A-Za-z0-9._-]*/
    XmlEncodingDecl = /\s+encoding\s*=\s*(?:"#{XmlEncName}"|'#{XmlEncName}')/
    XmlSDDecl = /\s+standalone\s*=\s*(?:'(?:yes|no)'|"(?:yes|no)")/
    XmlDecl = /<\?xml#{XmlVersionInfo}#{XmlEncodingDecl}?#{XmlSDDecl}?\s*\?>/
  end
end

# The code below is auto-generated.  Don't edit manually.
module HTree
  NamedCharacters =
{"AElig"=>198, "Aacute"=>193, "Acirc"=>194, "Agrave"=>192, "Alpha"=>913,
 "Aring"=>197, "Atilde"=>195, "Auml"=>196, "Beta"=>914, "Ccedil"=>199,
 "Chi"=>935, "Dagger"=>8225, "Delta"=>916, "ETH"=>208, "Eacute"=>201,
 "Ecirc"=>202, "Egrave"=>200, "Epsilon"=>917, "Eta"=>919, "Euml"=>203,
 "Gamma"=>915, "Iacute"=>205, "Icirc"=>206, "Igrave"=>204, "Iota"=>921,
 "Iuml"=>207, "Kappa"=>922, "Lambda"=>923, "Mu"=>924, "Ntilde"=>209, "Nu"=>925,
 "OElig"=>338, "Oacute"=>211, "Ocirc"=>212, "Ograve"=>210, "Omega"=>937,
 "Omicron"=>927, "Oslash"=>216, "Otilde"=>213, "Ouml"=>214, "Phi"=>934,
 "Pi"=>928, "Prime"=>8243, "Psi"=>936, "Rho"=>929, "Scaron"=>352, "Sigma"=>931,
 "THORN"=>222, "Tau"=>932, "Theta"=>920, "Uacute"=>218, "Ucirc"=>219,
 "Ugrave"=>217, "Upsilon"=>933, "Uuml"=>220, "Xi"=>926, "Yacute"=>221,
 "Yuml"=>376, "Zeta"=>918, "aacute"=>225, "acirc"=>226, "acute"=>180,
 "aelig"=>230, "agrave"=>224, "alefsym"=>8501, "alpha"=>945, "amp"=>38,
 "and"=>8743, "ang"=>8736, "apos"=>39, "aring"=>229, "asymp"=>8776,
 "atilde"=>227, "auml"=>228, "bdquo"=>8222, "beta"=>946, "brvbar"=>166,
 "bull"=>8226, "cap"=>8745, "ccedil"=>231, "cedil"=>184, "cent"=>162,
 "chi"=>967, "circ"=>710, "clubs"=>9827, "cong"=>8773, "copy"=>169,
 "crarr"=>8629, "cup"=>8746, "curren"=>164, "dArr"=>8659, "dagger"=>8224,
 "darr"=>8595, "deg"=>176, "delta"=>948, "diams"=>9830, "divide"=>247,
 "eacute"=>233, "ecirc"=>234, "egrave"=>232, "empty"=>8709, "emsp"=>8195,
 "ensp"=>8194, "epsilon"=>949, "equiv"=>8801, "eta"=>951, "eth"=>240,
 "euml"=>235, "euro"=>8364, "exist"=>8707, "fnof"=>402, "forall"=>8704,
 "frac12"=>189, "frac14"=>188, "frac34"=>190, "frasl"=>8260, "gamma"=>947,
 "ge"=>8805, "gt"=>62, "hArr"=>8660, "harr"=>8596, "hearts"=>9829,
 "hellip"=>8230, "iacute"=>237, "icirc"=>238, "iexcl"=>161, "igrave"=>236,
 "image"=>8465, "infin"=>8734, "int"=>8747, "iota"=>953, "iquest"=>191,
 "isin"=>8712, "iuml"=>239, "kappa"=>954, "lArr"=>8656, "lambda"=>955,
 "lang"=>9001, "laquo"=>171, "larr"=>8592, "lceil"=>8968, "ldquo"=>8220,
 "le"=>8804, "lfloor"=>8970, "lowast"=>8727, "loz"=>9674, "lrm"=>8206,
 "lsaquo"=>8249, "lsquo"=>8216, "lt"=>60, "macr"=>175, "mdash"=>8212,
 "micro"=>181, "middot"=>183, "minus"=>8722, "mu"=>956, "nabla"=>8711,
 "nbsp"=>160, "ndash"=>8211, "ne"=>8800, "ni"=>8715, "not"=>172, "notin"=>8713,
 "nsub"=>8836, "ntilde"=>241, "nu"=>957, "oacute"=>243, "ocirc"=>244,
 "oelig"=>339, "ograve"=>242, "oline"=>8254, "omega"=>969, "omicron"=>959,
 "oplus"=>8853, "or"=>8744, "ordf"=>170, "ordm"=>186, "oslash"=>248,
 "otilde"=>245, "otimes"=>8855, "ouml"=>246, "para"=>182, "part"=>8706,
 "permil"=>8240, "perp"=>8869, "phi"=>966, "pi"=>960, "piv"=>982,
 "plusmn"=>177, "pound"=>163, "prime"=>8242, "prod"=>8719, "prop"=>8733,
 "psi"=>968, "quot"=>34, "rArr"=>8658, "radic"=>8730, "rang"=>9002,
 "raquo"=>187, "rarr"=>8594, "rceil"=>8969, "rdquo"=>8221, "real"=>8476,
 "reg"=>174, "rfloor"=>8971, "rho"=>961, "rlm"=>8207, "rsaquo"=>8250,
 "rsquo"=>8217, "sbquo"=>8218, "scaron"=>353, "sdot"=>8901, "sect"=>167,
 "shy"=>173, "sigma"=>963, "sigmaf"=>962, "sim"=>8764, "spades"=>9824,
 "sub"=>8834, "sube"=>8838, "sum"=>8721, "sup"=>8835, "sup1"=>185, "sup2"=>178,
 "sup3"=>179, "supe"=>8839, "szlig"=>223, "tau"=>964, "there4"=>8756,
 "theta"=>952, "thetasym"=>977, "thinsp"=>8201, "thorn"=>254, "tilde"=>732,
 "times"=>215, "trade"=>8482, "uArr"=>8657, "uacute"=>250, "uarr"=>8593,
 "ucirc"=>251, "ugrave"=>249, "uml"=>168, "upsih"=>978, "upsilon"=>965,
 "uuml"=>252, "weierp"=>8472, "xi"=>958, "yacute"=>253, "yen"=>165,
 "yuml"=>255, "zeta"=>950, "zwj"=>8205, "zwnj"=>8204}


  module Pat
    NamedCharacters = /\A(?-mix:AElig|Aacute|Acirc|Agrave|Alpha|Aring|Atilde|Auml|Beta|Ccedil|Chi|Dagger|Delta|ETH|Eacute|Ecirc|Egrave|Epsilon|Eta|Euml|Gamma|Iacute|Icirc|Igrave|Iota|Iuml|Kappa|Lambda|Mu|Ntilde|Nu|OElig|Oacute|Ocirc|Ograve|Omega|Omicron|Oslash|Otilde|Ouml|Phi|Pi|Prime|Psi|Rho|Scaron|Sigma|THORN|Tau|Theta|Uacute|Ucirc|Ugrave|Upsilon|Uuml|Xi|Yacute|Yuml|Zeta|aacute|acirc|acute|aelig|agrave|alefsym|alpha|amp|and|ang|apos|aring|asymp|atilde|auml|bdquo|beta|brvbar|bull|cap|ccedil|cedil|cent|chi|circ|clubs|cong|copy|crarr|cup|curren|dArr|dagger|darr|deg|delta|diams|divide|eacute|ecirc|egrave|empty|emsp|ensp|epsilon|equiv|eta|eth|euml|euro|exist|fnof|forall|frac12|frac14|frac34|frasl|gamma|ge|gt|hArr|harr|hearts|hellip|iacute|icirc|iexcl|igrave|image|infin|int|iota|iquest|isin|iuml|kappa|lArr|lambda|lang|laquo|larr|lceil|ldquo|le|lfloor|lowast|loz|lrm|lsaquo|lsquo|lt|macr|mdash|micro|middot|minus|mu|nabla|nbsp|ndash|ne|ni|not|notin|nsub|ntilde|nu|oacute|ocirc|oelig|ograve|oline|omega|omicron|oplus|or|ordf|ordm|oslash|otilde|otimes|ouml|para|part|permil|perp|phi|pi|piv|plusmn|pound|prime|prod|prop|psi|quot|rArr|radic|rang|raquo|rarr|rceil|rdquo|real|reg|rfloor|rho|rlm|rsaquo|rsquo|sbquo|scaron|sdot|sect|shy|sigma|sigmaf|sim|spades|sub|sube|sum|sup|sup1|sup2|sup3|supe|szlig|tau|there4|theta|thetasym|thinsp|thorn|tilde|times|trade|uArr|uacute|uarr|ucirc|ugrave|uml|upsih|upsilon|uuml|weierp|xi|yacute|yen|yuml|zeta|zwj|zwnj)\z/
  end

  ElementContent =
{"h6"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "object"=>
  ["a", "abbr", "acronym", "address", "applet", "b", "basefont", "bdo", "big",
   "blockquote", "br", "button", "center", "cite", "code", "dfn", "dir", "div",
   "dl", "em", "fieldset", "font", "form", "h1", "h2", "h3", "h4", "h5", "h6",
   "hr", "i", "iframe", "img", "input", "isindex", "kbd", "label", "map",
   "menu", "noframes", "noscript", "object", "ol", "p", "param", "pre", "q",
   "s", "samp", "script", "select", "small", "span", "strike", "strong", "sub",
   "sup", "table", "textarea", "tt", "u", "ul", "var"],
 "dl"=>["dd", "dt"],
 "p"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "acronym"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "code"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "ul"=>["li"],
 "tt"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "label"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "form"=>
  ["a", "abbr", "acronym", "address", "applet", "b", "basefont", "bdo", "big",
   "blockquote", "br", "button", "center", "cite", "code", "dfn", "dir", "div",
   "dl", "em", "fieldset", "font", "form", "h1", "h2", "h3", "h4", "h5", "h6",
   "hr", "i", "iframe", "img", "input", "isindex", "kbd", "label", "map",
   "menu", "noframes", "noscript", "object", "ol", "p", "pre", "q", "s",
   "samp", "script", "select", "small", "span", "strike", "strong", "sub",
   "sup", "table", "textarea", "tt", "u", "ul", "var"],
 "q"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "thead"=>["tr"],
 "area"=>:EMPTY,
 "td"=>
  ["a", "abbr", "acronym", "address", "applet", "b", "basefont", "bdo", "big",
   "blockquote", "br", "button", "center", "cite", "code", "dfn", "dir", "div",
   "dl", "em", "fieldset", "font", "form", "h1", "h2", "h3", "h4", "h5", "h6",
   "hr", "i", "iframe", "img", "input", "isindex", "kbd", "label", "map",
   "menu", "noframes", "noscript", "object", "ol", "p", "pre", "q", "s",
   "samp", "script", "select", "small", "span", "strike", "strong", "sub",
   "sup", "table", "textarea", "tt", "u", "ul", "var"],
 "title"=>[],
 "dir"=>["li"],
 "s"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "ol"=>["li"],
 "hr"=>:EMPTY,
 "applet"=>
  ["a", "abbr", "acronym", "address", "applet", "b", "basefont", "bdo", "big",
   "blockquote", "br", "button", "center", "cite", "code", "dfn", "dir", "div",
   "dl", "em", "fieldset", "font", "form", "h1", "h2", "h3", "h4", "h5", "h6",
   "hr", "i", "iframe", "img", "input", "isindex", "kbd", "label", "map",
   "menu", "noframes", "noscript", "object", "ol", "p", "param", "pre", "q",
   "s", "samp", "script", "select", "small", "span", "strike", "strong", "sub",
   "sup", "table", "textarea", "tt", "u", "ul", "var"],
 "table"=>["caption", "col", "colgroup", "tbody", "tfoot", "thead", "tr"],
 "legend"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "cite"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "a"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "html"=>
  ["a", "abbr", "acronym", "address", "applet", "b", "base", "basefont", "bdo",
   "big", "blockquote", "body", "br", "button", "center", "cite", "code",
   "dfn", "dir", "div", "dl", "em", "fieldset", "font", "form", "h1", "h2",
   "h3", "h4", "h5", "h6", "head", "hr", "i", "iframe", "img", "input",
   "isindex", "kbd", "label", "map", "menu", "noframes", "noscript", "object",
   "ol", "p", "pre", "q", "s", "samp", "script", "select", "small", "span",
   "strike", "strong", "sub", "sup", "table", "textarea", "title", "tt", "u",
   "ul", "var"],
 "u"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "blockquote"=>
  ["a", "abbr", "acronym", "address", "applet", "b", "basefont", "bdo", "big",
   "blockquote", "br", "button", "center", "cite", "code", "dfn", "dir", "div",
   "dl", "em", "fieldset", "font", "form", "h1", "h2", "h3", "h4", "h5", "h6",
   "hr", "i", "iframe", "img", "input", "isindex", "kbd", "label", "map",
   "menu", "noframes", "noscript", "object", "ol", "p", "pre", "q", "s",
   "samp", "script", "select", "small", "span", "strike", "strong", "sub",
   "sup", "table", "textarea", "tt", "u", "ul", "var"],
 "center"=>
  ["a", "abbr", "acronym", "address", "applet", "b", "basefont", "bdo", "big",
   "blockquote", "br", "button", "center", "cite", "code", "dfn", "dir", "div",
   "dl", "em", "fieldset", "font", "form", "h1", "h2", "h3", "h4", "h5", "h6",
   "hr", "i", "iframe", "img", "input", "isindex", "kbd", "label", "map",
   "menu", "noframes", "noscript", "object", "ol", "p", "pre", "q", "s",
   "samp", "script", "select", "small", "span", "strike", "strong", "sub",
   "sup", "table", "textarea", "tt", "u", "ul", "var"],
 "b"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "base"=>:EMPTY,
 "th"=>
  ["a", "abbr", "acronym", "address", "applet", "b", "basefont", "bdo", "big",
   "blockquote", "br", "button", "center", "cite", "code", "dfn", "dir", "div",
   "dl", "em", "fieldset", "font", "form", "h1", "h2", "h3", "h4", "h5", "h6",
   "hr", "i", "iframe", "img", "input", "isindex", "kbd", "label", "map",
   "menu", "noframes", "noscript", "object", "ol", "p", "pre", "q", "s",
   "samp", "script", "select", "small", "span", "strike", "strong", "sub",
   "sup", "table", "textarea", "tt", "u", "ul", "var"],
 "link"=>:EMPTY,
 "var"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "samp"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "div"=>
  ["a", "abbr", "acronym", "address", "applet", "b", "basefont", "bdo", "big",
   "blockquote", "br", "button", "center", "cite", "code", "dfn", "dir", "div",
   "dl", "em", "fieldset", "font", "form", "h1", "h2", "h3", "h4", "h5", "h6",
   "hr", "i", "iframe", "img", "input", "isindex", "kbd", "label", "map",
   "menu", "noframes", "noscript", "object", "ol", "p", "pre", "q", "s",
   "samp", "script", "select", "small", "span", "strike", "strong", "sub",
   "sup", "table", "textarea", "tt", "u", "ul", "var"],
 "textarea"=>[],
 "pre"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "head"=>["base", "isindex", "title"],
 "span"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "br"=>:EMPTY,
 "script"=>:CDATA,
 "noframes"=>
  ["a", "abbr", "acronym", "address", "applet", "b", "basefont", "bdo", "big",
   "blockquote", "br", "button", "center", "cite", "code", "dfn", "dir", "div",
   "dl", "em", "fieldset", "font", "form", "h1", "h2", "h3", "h4", "h5", "h6",
   "hr", "i", "iframe", "img", "input", "isindex", "kbd", "label", "map",
   "menu", "noframes", "noscript", "object", "ol", "p", "pre", "q", "s",
   "samp", "script", "select", "small", "span", "strike", "strong", "sub",
   "sup", "table", "textarea", "tt", "u", "ul", "var"],
 "style"=>:CDATA,
 "meta"=>:EMPTY,
 "dt"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "option"=>[],
 "kbd"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "big"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "tfoot"=>["tr"],
 "sup"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "bdo"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "isindex"=>:EMPTY,
 "dfn"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "fieldset"=>
  ["a", "abbr", "acronym", "address", "applet", "b", "basefont", "bdo", "big",
   "blockquote", "br", "button", "center", "cite", "code", "dfn", "dir", "div",
   "dl", "em", "fieldset", "font", "form", "h1", "h2", "h3", "h4", "h5", "h6",
   "hr", "i", "iframe", "img", "input", "isindex", "kbd", "label", "legend",
   "map", "menu", "noframes", "noscript", "object", "ol", "p", "pre", "q", "s",
   "samp", "script", "select", "small", "span", "strike", "strong", "sub",
   "sup", "table", "textarea", "tt", "u", "ul", "var"],
 "em"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "font"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "tbody"=>["tr"],
 "noscript"=>
  ["a", "abbr", "acronym", "address", "applet", "b", "basefont", "bdo", "big",
   "blockquote", "br", "button", "center", "cite", "code", "dfn", "dir", "div",
   "dl", "em", "fieldset", "font", "form", "h1", "h2", "h3", "h4", "h5", "h6",
   "hr", "i", "iframe", "img", "input", "isindex", "kbd", "label", "map",
   "menu", "noframes", "noscript", "object", "ol", "p", "pre", "q", "s",
   "samp", "script", "select", "small", "span", "strike", "strong", "sub",
   "sup", "table", "textarea", "tt", "u", "ul", "var"],
 "li"=>
  ["a", "abbr", "acronym", "address", "applet", "b", "basefont", "bdo", "big",
   "blockquote", "br", "button", "center", "cite", "code", "dfn", "dir", "div",
   "dl", "em", "fieldset", "font", "form", "h1", "h2", "h3", "h4", "h5", "h6",
   "hr", "i", "iframe", "img", "input", "isindex", "kbd", "label", "map",
   "menu", "noframes", "noscript", "object", "ol", "p", "pre", "q", "s",
   "samp", "script", "select", "small", "span", "strike", "strong", "sub",
   "sup", "table", "textarea", "tt", "u", "ul", "var"],
 "col"=>:EMPTY,
 "small"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "dd"=>
  ["a", "abbr", "acronym", "address", "applet", "b", "basefont", "bdo", "big",
   "blockquote", "br", "button", "center", "cite", "code", "dfn", "dir", "div",
   "dl", "em", "fieldset", "font", "form", "h1", "h2", "h3", "h4", "h5", "h6",
   "hr", "i", "iframe", "img", "input", "isindex", "kbd", "label", "map",
   "menu", "noframes", "noscript", "object", "ol", "p", "pre", "q", "s",
   "samp", "script", "select", "small", "span", "strike", "strong", "sub",
   "sup", "table", "textarea", "tt", "u", "ul", "var"],
 "i"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "menu"=>["li"],
 "strong"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "basefont"=>:EMPTY,
 "img"=>:EMPTY,
 "optgroup"=>["option"],
 "map"=>
  ["address", "area", "blockquote", "center", "dir", "div", "dl", "fieldset",
   "form", "h1", "h2", "h3", "h4", "h5", "h6", "hr", "isindex", "menu",
   "noframes", "noscript", "ol", "p", "pre", "table", "ul"],
 "h1"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "address"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "p", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "sub"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "param"=>:EMPTY,
 "input"=>:EMPTY,
 "h2"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "abbr"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "h3"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "strike"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "body"=>
  ["a", "abbr", "acronym", "address", "applet", "b", "basefont", "bdo", "big",
   "blockquote", "br", "button", "center", "cite", "code", "dfn", "dir", "div",
   "dl", "em", "fieldset", "font", "form", "h1", "h2", "h3", "h4", "h5", "h6",
   "hr", "i", "iframe", "img", "input", "isindex", "kbd", "label", "map",
   "menu", "noframes", "noscript", "object", "ol", "p", "pre", "q", "s",
   "samp", "script", "select", "small", "span", "strike", "strong", "sub",
   "sup", "table", "textarea", "tt", "u", "ul", "var"],
 "ins"=>
  ["a", "abbr", "acronym", "address", "applet", "b", "basefont", "bdo", "big",
   "blockquote", "br", "button", "center", "cite", "code", "dfn", "dir", "div",
   "dl", "em", "fieldset", "font", "form", "h1", "h2", "h3", "h4", "h5", "h6",
   "hr", "i", "iframe", "img", "input", "isindex", "kbd", "label", "map",
   "menu", "noframes", "noscript", "object", "ol", "p", "pre", "q", "s",
   "samp", "script", "select", "small", "span", "strike", "strong", "sub",
   "sup", "table", "textarea", "tt", "u", "ul", "var"],
 "button"=>
  ["a", "abbr", "acronym", "address", "applet", "b", "basefont", "bdo", "big",
   "blockquote", "br", "button", "center", "cite", "code", "dfn", "dir", "div",
   "dl", "em", "fieldset", "font", "form", "h1", "h2", "h3", "h4", "h5", "h6",
   "hr", "i", "iframe", "img", "input", "isindex", "kbd", "label", "map",
   "menu", "noframes", "noscript", "object", "ol", "p", "pre", "q", "s",
   "samp", "script", "select", "small", "span", "strike", "strong", "sub",
   "sup", "table", "textarea", "tt", "u", "ul", "var"],
 "h4"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "select"=>["optgroup", "option"],
 "caption"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "colgroup"=>["col"],
 "tr"=>["td", "th"],
 "del"=>
  ["a", "abbr", "acronym", "address", "applet", "b", "basefont", "bdo", "big",
   "blockquote", "br", "button", "center", "cite", "code", "dfn", "dir", "div",
   "dl", "em", "fieldset", "font", "form", "h1", "h2", "h3", "h4", "h5", "h6",
   "hr", "i", "iframe", "img", "input", "isindex", "kbd", "label", "map",
   "menu", "noframes", "noscript", "object", "ol", "p", "pre", "q", "s",
   "samp", "script", "select", "small", "span", "strike", "strong", "sub",
   "sup", "table", "textarea", "tt", "u", "ul", "var"],
 "h5"=>
  ["a", "abbr", "acronym", "applet", "b", "basefont", "bdo", "big", "br",
   "button", "cite", "code", "dfn", "em", "font", "i", "iframe", "img",
   "input", "kbd", "label", "map", "object", "q", "s", "samp", "script",
   "select", "small", "span", "strike", "strong", "sub", "sup", "textarea",
   "tt", "u", "var"],
 "iframe"=>
  ["a", "abbr", "acronym", "address", "applet", "b", "basefont", "bdo", "big",
   "blockquote", "br", "button", "center", "cite", "code", "dfn", "dir", "div",
   "dl", "em", "fieldset", "font", "form", "h1", "h2", "h3", "h4", "h5", "h6",
   "hr", "i", "iframe", "img", "input", "isindex", "kbd", "label", "map",
   "menu", "noframes", "noscript", "object", "ol", "p", "pre", "q", "s",
   "samp", "script", "select", "small", "span", "strike", "strong", "sub",
   "sup", "table", "textarea", "tt", "u", "ul", "var"]}

  ElementInclusions =
{"head"=>["link", "meta", "object", "script", "style"], "body"=>["del", "ins"]}

  ElementExclusions =
{"button"=>
  ["a", "button", "fieldset", "form", "iframe", "input", "isindex", "label",
   "select", "textarea"],
 "a"=>["a"],
 "dir"=>
  ["address", "blockquote", "center", "dir", "div", "dl", "fieldset", "form",
   "h1", "h2", "h3", "h4", "h5", "h6", "hr", "isindex", "menu", "noframes",
   "noscript", "ol", "p", "pre", "table", "ul"],
 "title"=>["link", "meta", "object", "script", "style"],
 "pre"=>
  ["applet", "basefont", "big", "font", "img", "object", "small", "sub",
   "sup"],
 "form"=>["form"],
 "menu"=>
  ["address", "blockquote", "center", "dir", "div", "dl", "fieldset", "form",
   "h1", "h2", "h3", "h4", "h5", "h6", "hr", "isindex", "menu", "noframes",
   "noscript", "ol", "p", "pre", "table", "ul"],
 "label"=>["label"]}

  OmittedAttrName =
{"h6"=>
  {"center"=>"align", "justify"=>"align", "left"=>"align", "ltr"=>"dir",
   "right"=>"align", "rtl"=>"dir"},
 "object"=>
  {"bottom"=>"align", "declare"=>"declare", "left"=>"align", "ltr"=>"dir",
   "middle"=>"align", "right"=>"align", "rtl"=>"dir", "top"=>"align"},
 "dl"=>{"compact"=>"compact", "ltr"=>"dir", "rtl"=>"dir"},
 "p"=>
  {"center"=>"align", "justify"=>"align", "left"=>"align", "ltr"=>"dir",
   "right"=>"align", "rtl"=>"dir"},
 "acronym"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "code"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "ul"=>
  {"circle"=>"type", "compact"=>"compact", "disc"=>"type", "ltr"=>"dir",
   "rtl"=>"dir", "square"=>"type"},
 "tt"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "label"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "form"=>{"get"=>"method", "ltr"=>"dir", "post"=>"method", "rtl"=>"dir"},
 "q"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "thead"=>
  {"baseline"=>"valign", "bottom"=>"valign", "center"=>"align",
   "char"=>"align", "justify"=>"align", "left"=>"align", "ltr"=>"dir",
   "middle"=>"valign", "right"=>"align", "rtl"=>"dir", "top"=>"valign"},
 "area"=>
  {"circle"=>"shape", "default"=>"shape", "ltr"=>"dir", "nohref"=>"nohref",
   "poly"=>"shape", "rect"=>"shape", "rtl"=>"dir"},
 "td"=>
  {"baseline"=>"valign", "bottom"=>"valign", "center"=>"align",
   "char"=>"align", "col"=>"scope", "colgroup"=>"scope", "justify"=>"align",
   "left"=>"align", "ltr"=>"dir", "middle"=>"valign", "nowrap"=>"nowrap",
   "right"=>"align", "row"=>"scope", "rowgroup"=>"scope", "rtl"=>"dir",
   "top"=>"valign"},
 "title"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "dir"=>{"compact"=>"compact", "ltr"=>"dir", "rtl"=>"dir"},
 "s"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "ol"=>{"compact"=>"compact", "ltr"=>"dir", "rtl"=>"dir"},
 "hr"=>
  {"center"=>"align", "left"=>"align", "ltr"=>"dir", "noshade"=>"noshade",
   "right"=>"align", "rtl"=>"dir"},
 "applet"=>
  {"bottom"=>"align", "left"=>"align", "middle"=>"align", "right"=>"align",
   "top"=>"align"},
 "table"=>
  {"above"=>"frame", "all"=>"rules", "below"=>"frame", "border"=>"frame",
   "box"=>"frame", "center"=>"align", "cols"=>"rules", "groups"=>"rules",
   "hsides"=>"frame", "left"=>"align", "lhs"=>"frame", "ltr"=>"dir",
   "none"=>"rules", "rhs"=>"frame", "right"=>"align", "rows"=>"rules",
   "rtl"=>"dir", "void"=>"frame", "vsides"=>"frame"},
 "legend"=>
  {"bottom"=>"align", "left"=>"align", "ltr"=>"dir", "right"=>"align",
   "rtl"=>"dir", "top"=>"align"},
 "cite"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "a"=>
  {"circle"=>"shape", "default"=>"shape", "ltr"=>"dir", "poly"=>"shape",
   "rect"=>"shape", "rtl"=>"dir"},
 "html"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "u"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "blockquote"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "center"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "b"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "th"=>
  {"baseline"=>"valign", "bottom"=>"valign", "center"=>"align",
   "char"=>"align", "col"=>"scope", "colgroup"=>"scope", "justify"=>"align",
   "left"=>"align", "ltr"=>"dir", "middle"=>"valign", "nowrap"=>"nowrap",
   "right"=>"align", "row"=>"scope", "rowgroup"=>"scope", "rtl"=>"dir",
   "top"=>"valign"},
 "link"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "var"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "samp"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "div"=>
  {"center"=>"align", "justify"=>"align", "left"=>"align", "ltr"=>"dir",
   "right"=>"align", "rtl"=>"dir"},
 "textarea"=>
  {"disabled"=>"disabled", "ltr"=>"dir", "readonly"=>"readonly", "rtl"=>"dir"},
 "pre"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "head"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "span"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "br"=>{"all"=>"clear", "left"=>"clear", "none"=>"clear", "right"=>"clear"},
 "script"=>{"defer"=>"defer"},
 "noframes"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "style"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "meta"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "dt"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "option"=>
  {"disabled"=>"disabled", "ltr"=>"dir", "rtl"=>"dir", "selected"=>"selected"},
 "kbd"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "big"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "tfoot"=>
  {"baseline"=>"valign", "bottom"=>"valign", "center"=>"align",
   "char"=>"align", "justify"=>"align", "left"=>"align", "ltr"=>"dir",
   "middle"=>"valign", "right"=>"align", "rtl"=>"dir", "top"=>"valign"},
 "sup"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "bdo"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "isindex"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "dfn"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "fieldset"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "em"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "font"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "tbody"=>
  {"baseline"=>"valign", "bottom"=>"valign", "center"=>"align",
   "char"=>"align", "justify"=>"align", "left"=>"align", "ltr"=>"dir",
   "middle"=>"valign", "right"=>"align", "rtl"=>"dir", "top"=>"valign"},
 "noscript"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "li"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "col"=>
  {"baseline"=>"valign", "bottom"=>"valign", "center"=>"align",
   "char"=>"align", "justify"=>"align", "left"=>"align", "ltr"=>"dir",
   "middle"=>"valign", "right"=>"align", "rtl"=>"dir", "top"=>"valign"},
 "small"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "dd"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "i"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "menu"=>{"compact"=>"compact", "ltr"=>"dir", "rtl"=>"dir"},
 "strong"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "img"=>
  {"bottom"=>"align", "ismap"=>"ismap", "left"=>"align", "ltr"=>"dir",
   "middle"=>"align", "right"=>"align", "rtl"=>"dir", "top"=>"align"},
 "optgroup"=>{"disabled"=>"disabled", "ltr"=>"dir", "rtl"=>"dir"},
 "map"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "address"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "h1"=>
  {"center"=>"align", "justify"=>"align", "left"=>"align", "ltr"=>"dir",
   "right"=>"align", "rtl"=>"dir"},
 "sub"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "param"=>{"data"=>"valuetype", "object"=>"valuetype", "ref"=>"valuetype"},
 "input"=>
  {"bottom"=>"align", "button"=>"type", "checkbox"=>"type",
   "checked"=>"checked", "disabled"=>"disabled", "file"=>"type",
   "hidden"=>"type", "image"=>"type", "ismap"=>"ismap", "left"=>"align",
   "ltr"=>"dir", "middle"=>"align", "password"=>"type", "radio"=>"type",
   "readonly"=>"readonly", "reset"=>"type", "right"=>"align", "rtl"=>"dir",
   "submit"=>"type", "text"=>"type", "top"=>"align"},
 "h2"=>
  {"center"=>"align", "justify"=>"align", "left"=>"align", "ltr"=>"dir",
   "right"=>"align", "rtl"=>"dir"},
 "abbr"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "h3"=>
  {"center"=>"align", "justify"=>"align", "left"=>"align", "ltr"=>"dir",
   "right"=>"align", "rtl"=>"dir"},
 "strike"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "body"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "ins"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "button"=>
  {"button"=>"type", "disabled"=>"disabled", "ltr"=>"dir", "reset"=>"type",
   "rtl"=>"dir", "submit"=>"type"},
 "h4"=>
  {"center"=>"align", "justify"=>"align", "left"=>"align", "ltr"=>"dir",
   "right"=>"align", "rtl"=>"dir"},
 "select"=>
  {"disabled"=>"disabled", "ltr"=>"dir", "multiple"=>"multiple", "rtl"=>"dir"},
 "caption"=>
  {"bottom"=>"align", "left"=>"align", "ltr"=>"dir", "right"=>"align",
   "rtl"=>"dir", "top"=>"align"},
 "colgroup"=>
  {"baseline"=>"valign", "bottom"=>"valign", "center"=>"align",
   "char"=>"align", "justify"=>"align", "left"=>"align", "ltr"=>"dir",
   "middle"=>"valign", "right"=>"align", "rtl"=>"dir", "top"=>"valign"},
 "tr"=>
  {"baseline"=>"valign", "bottom"=>"valign", "center"=>"align",
   "char"=>"align", "justify"=>"align", "left"=>"align", "ltr"=>"dir",
   "middle"=>"valign", "right"=>"align", "rtl"=>"dir", "top"=>"valign"},
 "del"=>{"ltr"=>"dir", "rtl"=>"dir"},
 "h5"=>
  {"center"=>"align", "justify"=>"align", "left"=>"align", "ltr"=>"dir",
   "right"=>"align", "rtl"=>"dir"},
 "iframe"=>
  {"0"=>"frameborder", "1"=>"frameborder", "auto"=>"scrolling",
   "bottom"=>"align", "left"=>"align", "middle"=>"align", "no"=>"scrolling",
   "right"=>"align", "top"=>"align", "yes"=>"scrolling"}}

end
# The code above is auto-generated.  Don't edit manually.
