declare -a StringArray=('view' 'view_example')
for item in ${StringArray[@]}; do
    eval 'echo open $item && cd $item && rm -rf pubscpec.lock && flutter pub get && cd ..'
done