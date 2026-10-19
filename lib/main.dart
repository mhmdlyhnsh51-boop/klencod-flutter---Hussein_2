pkg update -y && pkg install python -y && mkdir -p ~/my-notes && cd ~/my-notes && cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>مذكرتي</title>
<style>
body{font-family:Arial;background:#f1f5f9;margin:0;padding:20px;color:#172033}
main{max-width:500px;margin:auto;background:white;padding:20px;border-radius:18px}
textarea{width:100%;height:180px;box-sizing:border-box;padding:12px;font-size:17px;border:1px solid #ddd;border-radius:10px}
button{padding:12px;border:0;border-radius:9px;background:#2563eb;color:white;margin:8px 0;cursor:pointer}
.note{background:#f1f5f9;padding:12px;margin-top:10px;border-radius:10px;white-space:pre-wrap;overflow-wrap:anywhere}
</style>
<main>
<h2>📝 مذكرتي</h2>
<textarea id="note" placeholder="اكتب ملاحظتك هنا..."></textarea>
<br><button onclick="save()">حفظ المذكرة</button>
<div id="notes"></div>
</main>
<script>
let data=JSON.parse(localStorage.getItem('notes')||'[]');
function render(){
 notes.innerHTML='';
 data.forEach((n,i)=>{
 let d=document.createElement('div');d.className='note';
 let p=document.createElement('p');p.textContent=n;
 let b=document.createElement('button');b.textContent='حذف';
 b.onclick=()=>{data.splice(i,1);persist()};
 d.append(p,b);notes.append(d);
 });
}
function persist(){localStorage.setItem('notes',JSON.stringify(data));render()}
function save(){let v=note.value.trim();if(v){data.unshift(v);persist();note.value=''}}
render();
</script>
</html>
EOF
python -m http.server 8000