# draft/.latexmkrc
$aux_dir = "aux_files";       # aux/log/synctex/etc go here

# Let BibTeX find .bib/.bst files in parent directory
# when running from aux_files/ (due to $aux_dir setting above)
my $sep = ($^O eq 'MSWin32') ? ';' : ':';
$ENV{'BIBINPUTS'} = ".$sep..$sep";
$ENV{'BSTINPUTS'} = ".$sep..$sep";
