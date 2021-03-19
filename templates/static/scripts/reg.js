"use strict";

// taken from https://stackoverflow.com/questions/27118900/auto-filling-parentheses-and-hyphen-for-phone-number-input-jquery
// by user Zanderi
// Phone number formatting
$("input[type='tel']").each(function(){
    $(this).on("change keyup paste", function (e) {
        var output,
        $this = $(this),
        input = $this.val();

        if(e.keyCode != 8) {
            input = input.replace(/[^0-9]/g, '');
            input = input.substr(0, 10);
            var area = input.substr(0, 3);
            var pre = input.substr(3, 3);
            var tel = input.substr(6, 4);
            if (area.length < 3) {
                output = "(" + area;
            } else if (area.length == 3 && pre.length < 3) {
                output = "(" + area + ")" + " " + pre;
            } else if (area.length == 3 && pre.length == 3) {
                output = "(" + area + ")" + " " + pre + "-" + tel;
            }
                $this.val(output);
        }
        else if (input.charAt(input.length - 1) == "-") {
            output = input.substr(0, input.length - 1);
            $this.val(output);
        }
        else if (input.charAt(input.length - 1) == " ") {
            output = input.substr(0, input.length - 2);
            $this.val(output);
        }
        else if (input.charAt(input.length - 1) == "(") {
            output = input.substr(0, input.length - 1);
            $this.val(output);
        }
    });
});

// Card number formatting
$("input[name='cardnumber']").each(function(){
    $(this).on("change keyup paste", function (e) {
        var output,
        $this = $(this),
        input = $this.val();

        if(e.keyCode != 8) {
            input = input.replace(/[^0-9]/g, '');
            input = input.substr(0, 16);
            var first = input.substr(0, 4);
            var second = input.substr(4, 4);
            var third = input.substr(8, 4);
            var fourth = input.substr(12);
            
            if (first.length < 4) {
                output = first;
            } else if (first.length == 4 && second.length < 4) {
                output = first + "-" + second;
            } else if (first.length == 4 && third.length < 4) {
                output = first + "-" + second + "-" + third;
            } else if (first.length ==4 && fourth.length == 0) {
                output = first + "-" + second + "-" + third;
            } else {
                output = first + "-" + second + "-" + third + "-" + fourth;
            }
            $this.val(output);
        }
        else if (input.charAt(input.length - 1) == "-") {
            output = input.substr(0, input.length - 1);
            $this.val(output);
        }
    });
});

$("input[name='cardexpiry']").each(function(){
    $(this).on("change keyup paste", function (e) {
        var output,
        $this = $(this),
        input = $this.val();

        if(e.keyCode != 8) {
            input = input.replace(/[^0-9]/g, '');
            input = input.substr(0, 4);
            var first = input.substr(0, 2);
            var second = input.substr(2, 2);
            
            if (first.length < 2) {
                output = first;
            } else {
                output = first + "/" + second;
            }
            $this.val(output);
        }
        else if (input.charAt(input.length - 1) == "-") {
            output = input.substr(0, input.length - 1);
            $this.val(output);
        }
    });
});


