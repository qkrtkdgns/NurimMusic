$(document).ready(function(){
 var timer,
 $obj = $('.roll'),
 $obju = $obj.find('ul'),
 $roli = $obj.find('li'),
 $rohe = $obj.find('li').width()+36;

 $obju.append($roli.eq(0).clone());
 $obju.append($roli.eq(1).clone());
 $obju.prepend($roli.eq($roli.length-1).clone());
 $obju.prepend($roli.eq($roli.length-2).clone());
 $roli = $obj.find('li');

 $obju.css('width',$rohe*$roli.length + 'px')
 $obju.css('marginLeft','-'+$rohe* + 'px')

 cnt = 1;
 var chk = false;
 function next(){
  chk = true;
  cnt = 1+cnt ;
  var leng = $rohe * (cnt*2) + 'px';
  if(cnt > $roli.length/2-2 ){
   $obju.animate({
    marginLeft:'-'+leng
   },1000, function(){
    cnt = 1;
    $obju.css("marginLeft",'-'+$rohe*2+'px')
    chk = false;
   })
  }else{
   $obju.animate({
    marginLeft:'-'+leng
   },1000,function(){
    chk = false;
   });
  }
 }

 function prev(){
  chk = true;
  cnt = cnt-1;
  var leng = $rohe * (cnt*2) + 'px';
  if(cnt < 1){
   $obju.animate({
    marginLeft:leng
   },1000, function(){
    cnt = $roli.length/2-2;
    $obju.css("marginLeft",'-'+$rohe*($roli.length-4)+'px')
    chk = false;
   })
  }else{
   $obju.animate({
    marginLeft:'-'+leng
   },1000,function(){
    chk = false;
   });
  }
  
 }
 function stop(){
  clearInterval(timer);
 }
 function start(){
  clearInterval(timer);
  timer = setInterval(next,2000);
 }
 start();

 $('.next').click(function(){
  if(chk) return false;
  next();
  return false;
 }).delay(500);
 $('.prev').click(function(){
  if(chk) return false;
  prev();
  return false;
 }).delay(500);
 $('.control').hover(stop,start);
 

})