# Video production toolchain

These tools take raw video and adds a (optional) pre-roll, title card, and endcard.

## Setup

Yes, it's in Perl. It works. Maybe I'll convert it to Python some day.
Probably not.

To use generate_title you might need to:

    sudo cpan install Text::Wrap
    sudo cpan install Getopt::Long

You will also need to have `mlt-melt` and ImageMagick installed. On Fedora, that's:

    sudo dnf install mlt
    sudo dnf install mlt-freeworld # MP4 support, available in rpmfusion repo.
    sudo dnf install newt
    sudo dnf install ImageMagick

Next, you need to create the following files:

    template_title.png
    endcard.png
    preroll.mp4 (optional)

The various `EXAMPLE` files will give you a template to work from, and
an idea of necessary file formats/sizes/resolution for YouTube.

## Usage

The process for generating a video is:

For each video:

Trim off any dead air at the beginning (and, optionally, end) of the video:

    ./trim raw_video.mp4 "00:01:23"

or

    ./trim raw_video.mp4 "00:01:23" "17:18:23"

Note: Trim retains a backup copy of your original video, in case you do
this part wrong.

Generate the title card using `generate_title`

    ./generate_title "Template File" "Event Name" "Title" "Speaker(s)"

Generate the final video using:

    ./merge_all raw_video.mp4

This will generate `raw_video_final.mp4` which will contain all of the
various components, in order.

In case you prefer a guided step-by-step flow, run:

    ./generate.sh

## Credit

Credit where due:

`trim` stuff came from https://www.arj.no/2018/05/18/trimvideo/

All of the `mlt` tricks came from Brian Proffitt.

The `generate_title` stuff all came from the ImageMagick docs.

