# Bash Argument Parser
Bash tool to help create bash variables derived from argument input

## How to use

### Local Use
``` 
source|. <project root>/src/arg-parser.sh \
--<arg1> arg value, spaces allowed \
--<arg2> arg2 value \
...
```

### Remote Access Use
```
source /dev/stdin <<<"$(curl https://raw.githubusercontent.com/scottglenblanch/bash-argument-parser/main/src/arg-parser.sh)" $@
```

## Result of Running
The arguments passed in will become bash variables in the bash instance that invoked `arg-parser.sh`

Examples:

```
. <project root>/src/arg-parser.sh --person Scott Blanch --power Coding
```

as well as ...

```
source /dev/stdin <<<"$(curl https://raw.githubusercontent.com/scottglenblanch/bash-argument-parser/main/src/arg-parser.sh)" \
--person Scott Blanch
--power Coding
```

will result in the creation of variables `PERSON` and `POWER`
(The argument name passed in has the dashes removed and is made all caps)

### Examples
[examples available in `./examples`](./examples)
