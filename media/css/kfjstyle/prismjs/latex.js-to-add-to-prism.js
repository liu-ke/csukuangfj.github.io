Prism.languages.latex = {
	'comment': {
		pattern: /(^|[^\\])%.*?(\r?\n|$)/g,
		lookbehind: true
	},
	'string': /(\$)(\\?.)*?\1/g,
	'number' : /\b-?(0x)?\d*\.?[\da-f]+\b/g,
	//'keyword': /\b(article|document|lstlisting|standalone)\b/g,
	'punctuation': /[\{\}]/g,
	'selector': /[\\][a-zA-Z;,:\.]*/g
};
