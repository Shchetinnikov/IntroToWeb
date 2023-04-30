function findPWithMaxText(p_lst) {
    let max_p = p_lst[0];

    for (let p of p_lst.slice(1, p_lst.length)) {
        if (max_p.textContent.length < p.textContent.length)
            max_p = p;
    }

    return max_p;
}


function getMouseCoordinates(e) {
    let div = document.createElement("div");
    div.textContent = `(${e.x}; ${e.y})`;
    
    const h1 = document.querySelector("h1");
    h1.after(div);
}


// main
let p_lst = Array.from(document.querySelectorAll("p.text"));

if (p_lst.length > 0) {
    // TASK-1
    const max_p = findPWithMaxText(p_lst); 
    console.log(max_p);

    // TASK-2
    max_p.classList.add("red");
    max_p.addEventListener("click", getMouseCoordinates);

}