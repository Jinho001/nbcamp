window.addEventListener("load", () => {
  const sections = document.querySelectorAll("#container>section");
  const snbul = document.querySelector(".snb>ul");
  const snblis = document.querySelectorAll(".snb>ul>li");
  const footer = document.querySelector("#footer");


  let devHeight;
  devHeight = window.innerHeight;
  console.log(devHeight);


  window.addEventListener('resize', () => {
    devHeight = window.innerHeight;
  });

  snbul.addEventListener("mouseover", () => {
    snbul.classList.add("on");
  });


  let currentPageIndex = 0;


  snblis.forEach((snbli, i) => {
    if (snbul.classList == (`on`)); {
      snbli.addEventListener("mouseover", () => {
        snbli.classList.add("on");
      })
      snbli.addEventListener("mouseout", () => {
        snbli.classList.remove("on");
      })
      snbli.addEventListener("click", e => {
        e.preventDefault();
        scrollTo(sections[i], i);
      })
    }
  });

  snbul.addEventListener("mouseout", () => {
    snbul.classList.remove("on");
  })

  sections.forEach((section, i) => {
    section.style.height = `${devHeight}px`
    document.addEventListener("scroll", e => {
      let scrolls = document.querySelector('html').scrollTop;
      if (scrolls >= (i * devHeight) && scrolls < (i + 1) * devHeight) {
        activation(i, snblis);
      }
      if (scrolls <= 180) {
        snbul.style.opacity = '0';
      } else {
        snbul.style.opacity = `1`;
      }
    })
  })
  const con1bt = document.querySelector(".con1bt");
  console.log(con1bt);
  con1bt.addEventListener("click", e => {
    e.preventDefault();
    currentPageIndex = 1;
    window.scroll({
      top: sections[1].offsetTop,
      behavior: "smooth"
    });
  })


  window.addEventListener("wheel", e => {
    e.preventDefault();
    if (e.deltaY > 0) {
      if (currentPageIndex < sections.length - 1) { // 페이지 인덱스의 상한 체크
        currentPageIndex++;
        window.scroll({
          top: sections[currentPageIndex].offsetTop,
          behavior: "smooth"
        });
      } else if (currentPageIndex === sections.length - 1) {
        window.scroll({
          top: footer.offsetTop,
          behavior: "smooth"
        });
      }
    } else if (e.deltaY < 0) {
      if (currentPageIndex > 0) { // 페이지 인덱스의 하한 체크
        currentPageIndex--;
        window.scroll({
          top: sections[currentPageIndex].offsetTop,
          behavior: "smooth"
        });
      }
    }
  }, {
    passive: false
  });

  function activation(index, list) {
    for (let el of list) {
      el.classList.remove("on");
    }
    list[index].classList.add("on");
  }


  function scrollTo(obj, i) {
    let height = obj.offsetTop;
    currentPageIndex = i;
    snblis[i].classList.add("on");
    window.scroll({
      top: height,
      behavior: "smooth"
    });
  }
})


 	// 페이지 로드 시 오류 메시지를 표시하는 함수
	    window.onload = function() {
	        displayErrorMessage();
	    };
	
	    // 오류 메시지를 alert으로 표시하는 함수
	    function displayErrorMessage() {
	        var errorMessage = document.getElementById('errorMessage').value;
	        if (errorMessage === 'true') {
	            alert("소셜 로그인 사용자는 수정 및 탈퇴가 불가능합니다.");
	        }
	    }
	    
	   function toggleZeroWaste(event) {
    var button = event.target; // 클릭된 버튼 요소를 가져옵니다.
    var contentRow = button.closest('tr').nextElementSibling;
    var contentText = contentRow.querySelector('p');

    // 버튼과 관련된 콘텐츠가 이미 활성화되어 있으면, 비활성화합니다.
    if (contentRow.classList.contains('on')) {
        contentRow.classList.remove('on');
        contentText.style.display = "none";
        button.classList.remove('fa-minus');
        button.classList.add('fa-plus');
    } else {
        // 버튼과 관련된 콘텐츠가 비활성화되어 있으면, 활성화합니다.
        contentRow.classList.add('on');
        contentText.style.display = "table-cell";
        button.classList.remove('fa-plus');
        button.classList.add('fa-minus');
    }
}

function toggleRow(event) {
    const targetRow = event.currentTarget.closest('tr');
    targetRow.classList.toggle('expanded');
}