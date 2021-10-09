#!/bin/bash



TEMPLATE_FILE=$(whiptail --title "Generate video (Step 1/6)" --menu "Please choose the title template:" 25 78 16 \
      "template_title_cs8.png" "Presentations related to CentOS Stream 8" \
      "template_title_cs9.png" "Presentations related to CentOS Stream 9" 3>&1 1>&2 2>&3)
[[ $? -ne 0 ]] && exit

generate_titlecard(){
  EVENT_NAME=$(whiptail --title "Generate video (Step 2/6)" --inputbox "Please enter the event name:" 10 100 3>&1 1>&2 2>&3)
  [[ $? -ne 0 ]] && exit
  PRESENTATION_TITLE=$(whiptail --title "Generate video (Step 3/6)" --inputbox "Please enter the presentation title:" 10 100 3>&1 1>&2 2>&3)
  [[ $? -ne 0 ]] && exit
  PRESENTATION_AUTHOR=$(whiptail --title "Generate video (Step 4/6)" --inputbox "Please enter the presentation author:" 10 100 3>&1 1>&2 2>&3)
  [[ $? -ne 0 ]] && exit

  ./generate_title "${TEMPLATE_FILE}" "${EVENT_NAME}" "${PRESENTATION_TITLE}" "${PRESENTATION_AUTHOR}"
}

generate_endcard(){
  convert ${TEMPLATE_FILE} -fill "#ffffff" -font Montserrat-Bold -pointsize 54 -annotate +353+188 "Thanks for watching!" endcard.png
  mogrify -fill "#000000" -font Montserrat-Regular -pointsize 28 -annotate +67+410 "For more information, visit www.centos.org" endcard.png
  mogrify -fill "#000000" -font Montserrat-Regular -pointsize 28 -annotate +67+470 "Please subscribe to our YouTube channel for more great content!" endcard.png
}

generate_video(){
  PRESENTATION_VIDEO=$(whiptail --title "Generate video (Step 6/6)" --inputbox "Please enter the source presentation video file name (e.g., interview.mp4):"  10 100 3>&1 1>&2 2>&3)
  [[ $? -ne 0 ]] && exit

  ./merge_all "${PRESENTATION_VIDEO}"
}

generate_titlecard
generate_endcard
generate_video

rm titlecard.png
rm endcard.png
