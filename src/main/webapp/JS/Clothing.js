$(document).ready(function() {
    // 온도와 강수 확률에 따라 이미지 추천
    $('#submit').click(function() {
        var temp = parseInt($('#temperature').val());
        var rain = $('#rain').val();

        var topImages = [];
        var bottomImages = [];
        var etcImages = [];

        if (isNaN(temp)) {
            return; // 온도가 입력되지 않은 경우 아무것도 하지 않음
        }

        if (temp >= 28) {
            topImages = ['images/sleeve.png', 'images/t.png'];
            bottomImages = ['images/shortpants.png', 'images/skirt.png'];
        } else if (temp >= 23) {
            topImages = ['images/t.png', 'images/shortshirt.png'];
            bottomImages = ['images/shortpants.png', 'images/skirt.png', 'images/longpants.png'];
        } else if (temp >= 20) {
            topImages = ['images/t.png', 'images/shortshirt.png', 'images/longshirt.png'];
            bottomImages = ['images/longpants.png'];
        } else if (temp >= 17) {
            topImages = ['images/cardigan.png','images/knit.png', 'images/mentomen.png', 'images/hood.png'];
            bottomImages = ['images/longpants.png'];
        } else if (temp >= 12) {
            topImages = ['images/jacket.png', 'images/leatherjacket.png', 'images/cardigan.png'];
            bottomImages = ['images/longpants.png'];
        } else if (temp >= 9) {
            topImages = ['images/coat.png', 'images/jacket.png', 'images/leatherjacket.png'];
            bottomImages = ['images/longpants.png'];
        } else if (temp >= 5) {
            topImages = ['images/coat.png', 'images/leatherjacket.png'];
            bottomImages = ['images/longpants.png'];
        } else {
            topImages = ['images/padding.png', 'images/coat.png'];
            bottomImages = ['images/longpants.png'];
            etcImages = ['images/muffler.png', 'images/gloves.png', 'images/hat.png'];
        }

        if (rain !== 'none') {
            etcImages.push('images/umbrella.png');
        }

        // 여러 개의 이미지를 추천 섹션에 추가
        var topHtml = '';
        var bottomHtml = '';
        var etcHtml = '';

        topImages.forEach(function(src) {
            topHtml += '<img src="' + src + '" alt="Top Image" class="selectable-image" style="width:100px; height:100px; margin:5px;">';
        });
        bottomImages.forEach(function(src) {
            bottomHtml += '<img src="' + src + '" alt="Bottom Image" class="selectable-image" style="width:100px; height:100px; margin:5px;">';
        });
        etcImages.forEach(function(src) {
            etcHtml += '<img src="' + src + '" alt="Etc Image" class="selectable-image" style="width:100px; height:100px; margin:5px;">';
        });

        $('#top-recommendation').html('<h3>Top</h3>' + topHtml);
        $('#bottom-recommendation').html('<h3>Bottom</h3>' + bottomHtml);
        $('#etc-recommendation').html('<h3>Etc</h3>' + etcHtml);

        // My Outfit에 이미지를 클릭하여 추가하는 이벤트 바인딩
        $(document).on('click', '.selectable-image', function() {
            var imgSrc = $(this).attr('src');
            var imgAlt = $(this).attr('alt');

            if (imgAlt === 'Top Image') {
                $('#top-box').html('<img src="' + imgSrc + '" alt="Top Image" style="width:100px; height:100px;">');
            } else if (imgAlt === 'Bottom Image') {
                $('#bottom-box').html('<img src="' + imgSrc + '" alt="Bottom Image" style="width:100px; height:100px;">');
            } else if (imgAlt === 'Etc Image') {
                $('#etc-box').html('<img src="' + imgSrc + '" alt="Etc Image" style="width:100px; height:100px;">');
            }
        });
    });
    // Initialize gender selection
    $('#gender-box').html('<img src="images/M.png" alt="Male" style="width:100px; height:100px;">');
    // Gender button functionality
    $('#male-button').click(function() {
        $('#gender-box').html('<img src="images/M.png" alt="Male" style="width:100px; height:100px;">');
        $('#male-button').addClass('active');
        $('#female-button').removeClass('active');
    });
    $('#female-button').click(function() {
        $('#gender-box').html('<img src="images/F.png" alt="Female" style="width:100px; height:100px;">');
        $('#female-button').addClass('active');
        $('#male-button').removeClass('active');
    });
});