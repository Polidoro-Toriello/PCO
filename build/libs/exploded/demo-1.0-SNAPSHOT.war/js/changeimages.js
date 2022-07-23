function changeimages() {
    var product = document.getElementById("product-img");
    var smallImg = document.getElementsByClassName("small-img");
    var categoria = document.getElementById("categoria").value;
    console.log(categoria)
    product.src = "../immagini/" + categoria + "1.jpg";
    smallImg[0].src = "../immagini/" + categoria + "1.jpg";
    smallImg[1].src = "../immagini/" + categoria + "2.jpg";
    smallImg[2].src = "../immagini/" + categoria + "3.jpg";
    smallImg[3].src = "../immagini/" + categoria + "4.jpg";
}