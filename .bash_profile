# lang
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# vim by brew
alias vim=/usr/local/Cellar/vim/8.0.1100_2/bin/vim
alias vi=vim
alias mvim=/Applications/MacVim.app/Contents/bin/mvim 

# anaconda3
export PATH="/Users/mrboliao/anaconda/bin:$PATH"

# android
export ANDROID_SDK_ROOT="/Users/mrboliao/Library/Android/sdk"
export PATH="$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH"

# gradle
export PATH="/Applications/Android Studio.app/Contents/gradle/gradle-2.14.1/bin:$PATH"

# junit
export JUNIT_ROOT="/Users/mrboliao/junit"
export CLASSPATH="$JUNIT_ROOT/hamcrest-core-1.3.jar:$JUNIT_ROOT/junit-4.10.jar:$JUNIT_ROOT/junit-addons-1.4.jar:$CLASSPATH"

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/mrboliao/Documents/repos/cocos2d-x-3.14/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=/Users/mrboliao/Documents/repos
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/mrboliao/Documents/repos/cocos2d-x-3.14/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/Users/mrboliao/Library/Android/sdk/ndk-bundle
export PATH=$NDK_ROOT:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/local/Cellar/ant/1.10.0/bin
export PATH=$ANT_ROOT:$PATH

# pyenv
export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

##
# Your previous /Users/mrboliao/.bash_profile file was backed up as /Users/mrboliao/.bash_profile.macports-saved_2017-02-04_at_01:52:47
##

# MacPorts Installer addition on 2017-02-04_at_01:52:47: adding an appropriate PATH variable for use with MacPorts.
#export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# graphiz
export GRAPHVIZ_DOT=/usr/local/bin/dot

# pandoc
export PATH=/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin:$PATH
