// Slide URLs are in the format: http://videolectures.net/site/normal_dl/tag=50735/mlss09uk_bishop_ibi_01.pdf

var talks = Array.from(document.querySelectorAll('td .lec_thumb'), s => ({
  title: s.querySelector('.thumb_title .thumb_short').textContent.trim(),
  auth: s.querySelector('div.author .thumb_short').textContent.trim(),
  url: talk_url = s.querySelector('a').href,
  slide_url: "",
  pic: s.querySelector('.lec_thumb_img').style.backgroundImage.replace('url("','').match('[^"]+')[0]
}))

// copy(talks)
// ⇢ talk_info.json
// ⇢ manually match to slides at http://mlg.eng.cam.ac.uk/mlss09/mlss_slides/