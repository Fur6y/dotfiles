# settings
# set -g theme_display_git yes
# set -g theme_display_git_untracked yes
# set -g theme_display_git_ahead_verbose yes
# set -g theme_git_worktree_support yes
# set -g theme_display_vagrant yes
# set -g theme_display_docker_machine yes
# set -g theme_display_hg yes
# set -g theme_display_virtualenv yes
# set -g theme_display_ruby yes
# set -g theme_display_user yes
# set -g theme_display_vi yes
set -g theme_display_date no
set -g theme_display_cmd_duration yes
# set -g theme_title_display_process yes
# set -g theme_title_display_path yes
# set -g theme_title_display_user no
# set -g theme_title_use_abbreviated_path yes
# set -g theme_date_format "+%a %H:%M"
# set -g theme_avoid_ambiguous_glyphs yes
# set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
# set -g default_user your_normal_user
# set -g theme_color_scheme dark
set -g fish_prompt_pwd_dir_length 3
set -g theme_project_dir_length 3

# user color theme
# base on solarized theme
set -l base03  002b36
set -l base02  073642
set -l base01  586e75
set -l base00  657b83
set -l base0   839496
set -l base1   93a1a1
set -l base2   eee8d5
set -l base3   fdf6e3
set -l yellow  b58900
set -l orange  cb4b16
set -l red     ba3634
set -l magenta d33682
set -l violet  6c71c4
set -l blue    268bd2
set -l cyan    2aa198
set -l green   859900

set colorfg $base3

set __color_initial_segment_exit     $base2 $red --bold
set __color_initial_segment_su       $base2 $green --bold
set __color_initial_segment_jobs     $base2 $blue --bold

set __color_path                     $base02 $base0
set __color_path_basename            $base02 $base1 --bold
set __color_path_nowrite             $base02 $orange
set __color_path_nowrite_basename    $base02 $orange --bold

set __color_repo                     $green $colorfg
set __color_repo_work_tree           $base02 $colorfg --bold
set __color_repo_dirty               $red $colorfg
set __color_repo_staged              $yellow $colorfg

set __color_vi_mode_default          $blue $colorfg --bold
set __color_vi_mode_insert           $green $colorfg --bold
set __color_vi_mode_visual           $yellow $colorfg --bold

set __color_vagrant                  $violet $colorfg --bold
set __color_username                 $base02 $blue
set __color_rvm                      $red $colorfg --bold
set __color_virtualfish              $cyan $colorfg --bold
