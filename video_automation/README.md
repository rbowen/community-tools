# Video production toolchain

These tools take raw video and adds a pre-roll, title card, and endcard.

## Setup

Yes, it's in Perl. It works. Maybe I'll convert it to Python some day.
Probably not.

To use generate_title you might need to:

    sudo cpan install Text::Wrap
    sudo cpan install Getopt::Long

You will also need to have mlt-melt installed.

Next, you need to create the following files:

    TEMPLATE_TITLE.png
    endcard.png
    preroll.mp4 (optional)

## Usage

The process for generating a video is:

For each video:

Trim off any dead air at the beginning of the video:

    ./trim raw_video.mp4 123

Generate the title card using generate_title

    ./generate_title "Title" "Speaker(s)"

Generate the final video using:

    ./merge_all raw_video.mp4

This will generate raw_video_final.mp4 which will contain all of the
various components, in order.


