(import-macros {: color} :fnl.oil-8.macros.palette)

{ :groups
  #{:Boolean {:fg (color :macaroni-and-cheese)}
    :Character {:fg (color :medium-aquamarine)}
    :Comment {:fg (color :burnished-brown)}
    :Constant {:fg (color :big-foot-feet)}
    :Delimiter {:fg (color :jungle-green) :bold true}
    :Error {:fg (color :brink-pink) :bold true :reverse true}
    :Float {:fg (color :inchworm)}
    :Function {:link :Identifier}
    :Identifier {:fg (color :blue-jeans)}
    :Label {:fg (color :mauve)}
    :Number {:fg (color :chinese-green)}
    :Operator {:link :Special}
    :Preproc {:fg (color :brink-pink)}
    :Special {:fg (color :turquoise)}
    :Statement {:fg (color :light-deep-pink)}
    :String {:fg (color :mantis)}
    :Tag {:fg (color :mauve)}
    :Todo {:fg (color :violets-are-blue) :bold true :reverse true}
    :Type {:fg (color :violets-are-blue)}}}