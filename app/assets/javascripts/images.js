/**
 * Created by kpahawa on 3/24/2015.
 */

function disp(title, summary,i) {

    $("#pic"+i).hover(function() {
            x = document.getElementById("pic"+i);
            var el = document.createElement("span");
            el.setAttribute("id","picDesc"+i);
            el.innerHTML = summary;
            var span = document.createElement("span");
            span.setAttribute("id","picTitleSpan");

            span.innerHTML = title;
            insertAfter(x,span);
            insertAfter(span,el);
            $("#picDesc" + i).css({
                "position": "absolute",
                "left": "1.5em",
                "margin-top":"4.5em",
                "font-size":"2em;",
                "color":"#333333",
                "margin-right":"1em",
                "width":"80%"

            })
        },function(){
            $("#picDesc" + i).remove();
            $("#picTitleSpan").remove();
        }
    );}

function insertAfter(referenceNode, newNode) {
    referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling);
    }