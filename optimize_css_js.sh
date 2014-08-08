echo "==============================================="
echo " Build Script v0.1 - YUICompressor"
echo "==============================================="
 
echo "combining css to style.css"
cat /store/skin/frontend/mytheme/theme/css/styles.css /store/skin/frontend/base/default/css/widgets.css /store/skin/frontend/mytheme/theme/css/skin.css /store/assets/css/jquery.modal.min.css > /store/css/style.css
 
echo "minifying combining css to style.min.css"
java -jar /build/yuicompressor-2.4.7.jar /store/css/mysite.css -o /store/css/mysite.min.css
 
echo "combining magento js to scriptaculous-varien-magento.js"
cat /store/js/scriptaculous/builder.js /store/js/scriptaculous/effects.js /store/js/scriptaculous/dragdrop.js /store/js/scriptaculous/controls.js /store/js/scriptaculous/slider.js /store/js/varien/js.js /store/js/varien/form.js /store/js/mage/translate.js /store/js/mage/cookies.js | uglifyjs -o /store/js/scriptaculous-varien-magento.js
 
#echo "minifying any other random js files"
 
echo 'minifying prototype files'
java -jar /build/yuicompressor-2.4.7.jar /store/js/prototype/prototype.js -o /store/js/prototype/prototype.min.js
java -jar /build/yuicompressor-2.4.7.jar /store/js/prototype/validation.js -o /store/js/prototype/validation.min.js
 
echo "done"
