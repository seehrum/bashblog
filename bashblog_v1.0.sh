#!/bin/bash

# bashblog v1.0 
# Author: Raphael Ciribelly
# Size: 19088 bytes
# Date: 2021-09-20

# STATUS: Stable

# revert compressed html and css files 
# sed -i 's|><|>\n<|g' *.html
# sed -i 's|}|}\n|g' *.css

# OS: Debian GNU/Linux 10 (buster)
# bash version: GNU bash, versão 5.0.3(1)-release (x86_64-pc-linux-gnu)
# sed version: sed (GNU sed) 4.7
# grep version: grep (GNU grep) 3.3
# vim version: VIM - Vi IMproved 8.1 
# mkdir version: mkdir (GNU coreutils) 8.30
# xargs version: xargs (GNU findutils) 4.6.0.225-235f
# seq version: seq (GNU coreutils) 8.30
# mv version: (GNU coreutils) 8.30
# cp version: cp (GNU coreutils) 8.30

# Global Variables - set the names inside the double quotes, CONFIGURE!
WEBSITE_NAME="Name Website"
WEBSITE_LINK="https://www.Website.com"
TWITTER="@twitter"
LINK_IMG_BLOG="blog image path"
FAVICON="favicon.ico"
MENU_NAME_1="Home"
CSS_1="normalize.css"
CSS_2="style.css"
MENU_LINK_1="index.html" 
EMAIL_LINK="email@email.com"
BACKARROW="↵"
TITLE_LINK_BACKARROW="back"
TITLE_TAG="TAGS"
DIR_CSS="css"
DIR_TAGS="tags"
DIR_IMG="img"
DIR_BACKUP="backup"
SOCIAL_NAME_1="Facebook"
SOCIAL_NAME_2="Instagram"
SOCIAL_NAME_3="YouTube"
SOCIAL_LINK_1="link facebook"
SOCIAL_LINK_2="link instagram"
SOCIAL_LINK_3="link youtube"
COPYRIGHT="© 2021 - All rights reserved"
AUTHOR="AUTHOR Website"
LANGUAGE="en-US"
DESCRIPTION="description website"
BROWSER="firefox"
EDITOR="vim"
INDEXHTML="index.html"

# checks if files exist
CHECK_FILES(){
for i in ${INDEXHTML} ${DIR_TAGS} ${DIR_CSS} ${DIR_IMG} ;do
[[ ! -e "${i}" ]] && { echo "$i Does not exist." ; exit 1 ; }
done
}

# check if index.html file is compressed 
CHECK_COMPRESS(){
if [ $(wc -l <${INDEXHTML}) -eq 1  ];
then
echo "ERROR: index.html file is compressed"
exit 1
fi
}

# Create files and execute fuction BASE_HTML
NEW(){
if [[ -e "${INDEXHTML}" ]]; then
echo "Files already exist!"
exit 0
else
echo "Creating the necessary files and folders"
mkdir -v "${DIR_CSS}"       ; \
mkdir -v "${DIR_TAGS}"      ; \
mkdir -v "${DIR_IMG}"       ; \
BASE_HTML			        ; \
exit 0
fi
}

# generates html files
BASE_HTML(){

# index.html
if [[ ! -e "${INDEXHTML}" ]] ; then
cat <<EOF > "${INDEXHTML}"
<!DOCTYPE html>
<html lang="${LANGUAGE}">
	<head>
		<meta charset="UTF-8">
		<title>${MENU_NAME_1} | ${WEBSITE_NAME}</title>
		<link rel="shortcut icon" href="${FAVICON}">
		<meta name="author" content="${AUTHOR}">
		<meta name="robots" content="index, follow" />
		<meta name="googlebot" content="index, follow, max-snippet:-1, max-image-preview:large, max-video-preview:-1" />
		<meta name="bingbot" content="index, follow, max-snippet:-1, max-image-preview:large, max-video-preview:-1" />
		<meta property="og:image" content="${LINK_IMG_BLOG}" />
		<meta name="description" content="${DESCRIPTION}">
		<meta name="application-name" content="${WEBSITE_NAME}">
		<meta property="og:description" content="${DESCRIPTION}">
		<meta property="og:locale" content="${LANGUAGE}">
		<meta property="og:url" content="${WEBSITE_LINK}/${MENU_LINK_1}">
		<meta property="og:title" content="${MENU_NAME_1}">
		<meta property="og:site_name" content="${WEBSITE_NAME}">
		<meta property="og:type" content="website">
		<meta name="keywords" content="${MENU_NAME_1}, ${WEBSITE_NAME}"/>
		<meta name="twitter:title" content="${WEBSITE_NAME}"/>
		<meta name="twitter:card" content="summary_large_image"/>
		<meta name="twitter:site" value="${TWITTER}"/>
		<meta name="twitter:description" content="${DESCRIPTION}" />
		<link rel="canonical" href="${WEBSITE_LINK}/${MENU_LINK_1}" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" type="text/css" href="${DIR_CSS}/${CSS_1}">
		<link rel="stylesheet" type="text/css" href="${DIR_CSS}/${CSS_2}">
	</head>
	<body>
		<header>
			<h1>${WEBSITE_NAME}</h1>
				<nav>
					<input class="menu-btn" type="checkbox" id="menu-btn" />
					<label class="menu-icon" for="menu-btn"><span class="navicon"></span></label>
					<ul class="menu">
						<li><a class="active" href="${MENU_LINK_1}">${MENU_NAME_1}</a></li>
					</ul>
				</nav>
		</header>
		<main>
		</main>
		<footer>
			<p>$COPYRIGHT</p>
			<ul>
				<li><a href="${SOCIAL_LINK_1}">${SOCIAL_NAME_1}</a></li>
				<li><a href="${SOCIAL_LINK_2}">${SOCIAL_NAME_2}</a></li>
				<li><a href="${SOCIAL_LINK_3}">${SOCIAL_NAME_3}</a></li>
			</ul>
		</footer>
	</body>
</html>
EOF
echo "index file successfully created!"
else

# ADD_POST_BLOG

# variables
local date_hour="$(date +"%Y-%m-%d %R:%S" | xargs)"
local date_hour2="$(date +"%Y-%m-%d - %R:%S" | xargs)"
local date_hour3="$(date +"%Y-%m-%d" | xargs)"

#post in index.html
read -ep "Post title: " post_title

# variables
local post_title_upper="${post_title^^}"
local post_title_lower="${post_title,,}"

# check if variable is null
if [[ -z "${post_title}" ]] ; then
echo "ERROR: name not specified"
exit 1
else
sleep 0
fi

# check if variable has special characters
if [[ "${post_title}" =~ ^[0-9A-Za-z\ ]+$ ]] && [[ "${post_title}" != *['!'@#\$%^ÀÈÌÒÙùòìèàÝÚÓÍÉÁýúóíéáÛÔÎÊÂûôîêâÕÑÃõñãŸÜÖÏËÄÿüöïëäÇç\&*()_+]* ]] ; then
sleep 0
else
echo "ERROR: has special characters"
exit 1
fi

sed -i '/<main>/a \
		<!-- POST:'"${post_title_upper// /-}"' - DATE:'"${date_hour3}"' -->\
			<article class="article-post" id="'"${post_title_lower// /-}"'">\
				<header class="header-post">\
					<a href="#'"${post_title_lower// /-}"'">\
						<h2>'"${post_title}"'</h2>\
					</a>\
					<span>by '"${AUTHOR}"' <time datetime="'"${date_hour}"'">'"${date_hour2}"'</time></span>\
				</header>\
					<p>TEXT HERE</p>\
				<footer class="footer-post">\
					<a class="backarrow" href="'"${INDEXHTML}"'" title="'"${TITLE_LINK_BACKARROW}"'">'"${BACKARROW}"'</a>\
				</footer>\
			</article>\
		<!-- POST:'"${post_title_upper// /-}"' - DATE:'"${date_hour3}"' END -->\
' ${INDEXHTML}
ADD_TAG_BLOG
${EDITOR} ${INDEXHTML}
fi
}

# ADD TAG
ADD_TAG_BLOG(){
read -ep "ADD TAGS?[Y/N]: " answer
if [ "$answer" != "${answer#[Yy]}" ] ;then

#add the word #@TAGS to index.html
sed -i '0,/<footer class="footer-post">/s//<footer class="footer-post">\n\t\t\t\t\t<p>#@TAGS:<\/p>/' ${INDEXHTML}

cat<<EOF 
tips for adding tags:
1 - don't use tags with the same name in the same post
2 - don't create tags without names
3 - configure the number of tags you want, in the variable NUMBERS_TAGS
4 - don't use accented words
5 - avoid using very long words
EOF

# number of tags
while :
do
read -ep "Number of tags: " number_tag

# checks if the variable has only two digits
if [[ "${number_tag}" = ?(+|-)+([0-9]) ]] ; then 
	break
else
	echo "ERROR: value must be numeric and only have two digits"
	$REPLAY
fi
done

# tags - get tag name
for i in $(seq 1 ${number_tag})
do
read -ep "Tag[${i}]: " tag

# variables
local tag_upper=${tag^^} 
local tag_lower=${tag,,} 

if [ ! -e ${DIR_TAGS}/tag_${tag_lower// /-}.html ] ; then
read -ep "Keywords tag[${i}]: " keywords_tag
read -ep "Description tag[${i}]: " description_tag
else
sleep 0
fi

# check if variable is null
if [[ -z "${tag}" ]] ; then
echo "ERROR: no name specified"
exit 1
else
sleep 0
fi

# check if variable has special characters
if [[ "${tag}" =~ ^[0-9A-Za-z\ -]+$ ]] && [[ "${tag}" != *['!'@#\$%^ÀÈÌÒÙùòìèàÝÚÓÍÉÁýúóíéáÛÔÎÊÂûôîêâÕÑÃõñãŸÜÖÏËÄÿüöïëäÇç\&*()_+]* ]] ; then
sleep 0
else
echo "ERROR: has special characters"
exit 1
fi

if [[ ! -e ${DIR_TAGS}/tag_${tag_lower// /-}.html ]] ; then
cat <<EOF > "${DIR_TAGS}/tag_${tag_lower// /-}.html"
<!DOCTYPE html>
<html lang="${LANGUAGE}">
	<head>
		<meta charset="UTF-8">
		<title>${TITLE_TAG} | ${tag^^}</title>
		<link rel="shortcut icon" href="${FAVICON}">
		<meta name="author" content="${AUTHOR}">
		<meta name="robots" content="index, follow" />
		<meta name="googlebot" content="index, follow, max-snippet:-1, max-image-preview:large, max-video-preview:-1" />
		<meta name="bingbot" content="index, follow, max-snippet:-1, max-image-preview:large, max-video-preview:-1" />
		<meta name="description" content="${description_tag}">
		<meta name="application-name" content="${WEBSITE_NAME}">
		<meta property="og:description" content="${description_tag}">
		<meta property="og:locale" content="${LANGUAGE}">
		<meta property="og:url" content="${WEBSITE_LINK}/${DIR_TAGS}/tag_${tag,,}.html" />
		<meta property="og:title" content="${TITLE_TAG}">
		<meta property="og:site_name" content="${WEBSITE_NAME}">
		<meta property="og:type" content="website">
		<meta name="keywords" content="${keywords_tag}, ${WEBSITE_NAME}"/>
		<meta name="twitter:title" content="${TITLE_TAG}"/>
		<meta name="twitter:card" content="summary_large_image"/>
		<meta name="twitter:site" value="${TWITTER}"/>
		<meta name="twitter:description" content="${description_tag}" />
		<link rel="canonical" href="${WEBSITE_LINK}/${DIR_TAGS}/tag_${tag,,}.html" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" type="text/css" href="../${DIR_CSS}/${CSS_1}">
		<link rel="stylesheet" type="text/css" href="../${DIR_CSS}/${CSS_2}">
	</head>
	<body>
		<header>
			<h1>${WEBSITE_NAME}</h1>
				<nav>
					<input class="menu-btn" type="checkbox" id="menu-btn" />
					<label class="menu-icon" for="menu-btn"><span class="navicon"></span></label>
					<ul class="menu">
						<li><a href="../${MENU_LINK_1}">${MENU_NAME_1}</a></li>
					</ul>
				</nav>
		</header>
		<main>
			<h2>TAG: #${tag_upper// /-}</h2>
			<ul>
<!-- TAG -->			
			</ul>
		</main>
		<footer>
			<p>$COPYRIGHT</p>
			<ul>
				<li><a href="${SOCIAL_LINK_1}">${SOCIAL_NAME_1}</a></li>
				<li><a href="${SOCIAL_LINK_2}">${SOCIAL_NAME_2}</a></li>
				<li><a href="${SOCIAL_LINK_3}">${SOCIAL_NAME_3}</a></li>
			</ul>
		</footer>
	</body>
</html>
EOF

else
sleep 0
fi

local date_hour3="$(date +"%Y-%m-%d" | xargs)"

# add tags to index.html 
sed -i 's/#@TAGS:/& <a href="'"${DIR_TAGS}"'\/tag_'"${tag_lower// /-}"'.html" rel="'"${tag_lower}"'">#'"${tag_lower}"'<\/a>/' ${INDEXHTML}

# add comments to html tag file 
sed -i '/<!-- TAG -->/a <!-- POST:'"${post_title_upper// /-}"' - DATE:'"${date_hour3}"' END -->' ${DIR_TAGS}/tag_${tag_lower// /-}.html

sed -i '/<!-- TAG -->/a <!-- POST:'"${post_title_upper// /-}"' - DATE:'"${date_hour3}"' -->' ${DIR_TAGS}/tag_${tag_lower// /-}.html

# tag link 
sed -i '/<\!-- POST:'"${post_title_upper// /-}"' - DATE:'"${date_hour3}"' -->/a <li><article><h4><a href="../'"${INDEXHTML}"'#'"${post_title_lower// /-}"'" title="'"${post_title}"'">'"${post_title}"'</a></h4><time datetime="'"${date_hour}"'">'"${date_hour2}"'</time></article></li>' ${DIR_TAGS}/tag_${tag_lower// /-}.html

done

#changes the word #@TAG: to just TAG: 
sed -i 's/#@TAGS:/TAGS:/g' ${INDEXHTML}

else
sleep 0
fi
}

DEL_POST_BLOG(){

read -ep "Post title: " post_title

# variables
local post_title_upper="${post_title^^}"
local post_title_lower="${post_title,,}"


# check if variable is null
if [[ -z "${post_title}" ]] ; then
echo "ERROR: name not specified"
exit 1
else
sleep 0
fi

# check if post exist
if grep -qow '<!-- POST:'"${post_title_upper// /-}"'.*' ${INDEXHTML} ; then
sleep 0
else
echo "ERROR: POST does not exist!."
exit 1
fi

# Year
read -ep "Year: " year_post

# check if variable is null
if [[ -z "${year_post}" ]] ; then
echo "ERROR: name not specified"
exit 1
else
sleep 0
fi

# checks if the variable has only four digits
if [[ "${year_post}" = ?(+|-)+([0-9]) ]] && [[ "${#year_post}" -eq 4 ]] ; then 
sleep 0
else
echo "ERROR: value must be numeric and only have four digits"
exit 1
fi

# Month
read -ep "Month: " month_post

# check if variable is null
if [[ -z "${month_post}" ]] ; then
echo "ERROR: name not specified"
exit 1
else
sleep 0
fi

# checks if the variable has only two digits
if [[ "${month_post}" = ?(+|-)+([0-9]) ]] && [[ "${#month_post}" -eq 2 ]] ; then 
sleep 0
else
echo "ERROR: value must be numeric and only have two digits"
exit 1
fi

# Day
read -ep "Day: " day_post

# check if variable is null
if [[ -z "${day_post}" ]] ; then
echo "ERROR: name not specified"
exit 1
else
sleep 0
fi

# checks if the variable has only two digits
if [[ "${day_post}" = ?(+|-)+([0-9]) ]] && [[ "${#day_post}" -eq 2 ]] ; then 
sleep 0
else
echo "ERROR: value must be numeric and only have two digits"
exit 1
fi

# delete post in index.html
sed -i '/<!-- POST:'"${post_title_upper// /-}"' - DATE:'"${year_post}"'-'"${month_post}"'-'"${day_post}"' -->/,/<!-- POST:'"${post_title_upper// /-}"' - DATE:'"${year_post}"'-'"${month_post}"'-'"${day_post}"' END -->/d' ${INDEXHTML}

# delete post from tag files 
sed -i '/<!-- POST:'"${post_title_upper// /-}"' - DATE:'"${year_post}"'-'"${month_post}"'-'"${day_post}"' -->/,/<!-- POST:'"${post_title_upper// /-}"' - DATE:'"${year_post}"'-'"${month_post}"'-'"${day_post}"' END -->/d' ${DIR_TAGS}/*.html 2>/dev/null

# delete empty tags 
grep -rIL "<\!-- POST:.*" ${DIR_TAGS}/*.html 2>/dev/null | xargs rm -rv 2>/dev/null

}

ADD_LINK(){
read -ep "HTML file name: " new_link_html

local html_name_upper="${new_link_html^^}"
local html_name_lower="${new_link_html,,}"

# check if variable is null
if [[ -z "${new_link_html}" ]] ; then
echo "ERROR: no name specified"
exit 1
else
sleep 0
fi

# check if variable has special characters
if [[ "${new_link_html}" =~ ^[0-9A-Za-z\ ]+$ ]] && [[ "${new_link_html}" != *['!'@#\$%^ÀÈÌÒÙùòìèàÝÚÓÍÉÁýúóíéáÛÔÎÊÂûôîêâÕÑÃõñãŸÜÖÏËÄÿüöïëäÇç\&*()_+]* ]] ; then
sleep 0
else
echo "ERROR: has special characters"
exit 1
fi

read -ep "Link name: " new_link

local html_name_upper="${new_link^^}"
local html_name_lower="${new_link,,}"

# check if variable is null
if [[ -z "${new_link}" ]] ; then
echo "ERROR: no name specified"
exit 1
else
sleep 0
fi

# add link in index.html
sed -i -e 's/<li><a class=\"active\" href=\"'"${MENU_LINK_1}"'\">'"${MENU_NAME_1}"'<\/a><\/li>/<li><a class=\"active\" href=\"'"${MENU_LINK_1}"'\">'"${MENU_NAME_1}"'<\/a><\/li>\n\t\t\t\t\t\t<li><a href=\"'"${html_name_lower// /-}.html"'\">'"${new_link}"'<\/a><\/li>/' ${INDEXHTML}

}

DEL_LINK(){
read -ep "HTML file name: " del_link_html

local del_link_html_upper="${del_link_html^^}"
local del_link_html_lower="${del_link_html,,}"

# check if variable is null
if [[ -z "${del_link_html}" ]] ; then
echo "ERROR: no name specified"
exit 1
else
sleep 0
fi

# check if variable has special characters
if [[ "${del_link_html}" =~ ^[0-9A-Za-z\ ]+$ ]] && [[ "${del_link_html}" != *['!'@#\$%^ÀÈÌÒÙùòìèàÝÚÓÍÉÁýúóíéáÛÔÎÊÂûôîêâÕÑÃõñãŸÜÖÏËÄÿüöïëäÇç\&*()_+]* ]] ; then
sleep 0
else
echo "ERROR: has special characters"
exit 1
fi

read -ep "Link name (case-sensitive): " del_link_name

# check if variable is null
if [[ -z "${del_link_name}" ]] ; then
echo "ERROR: no name specified"
exit 1
else
sleep 0
fi

# checks if link exists in index.html file 
if grep -qow '<li><a href="'"${del_link_html_lower// /-}.html"'">'"${del_link_name}"'' ${INDEXHTML} ; then
sleep 0
else
echo "ERROR: Link does not exist!."
exit 1
fi

# delete link in index
sed -i '/<li><a class="active" href="'"${del_link_html_lower// /-}.html"'">'"${del_link_name}"'.*/d' ${INDEXHTML}

sed -i '/<li><a href="'"${del_link_html_lower// /-}.html"'">'"${del_link_name}"'.*/d' ${INDEXHTML}
}

COMPRESS(){
# backup
mkdir -v ${DIR_BACKUP}
cp -v ${INDEXHTML} ${DIR_BACKUP}
cp -r -v ${DIR_TAGS} ${DIR_BACKUP}
cp -r -v ${DIR_CSS} ${DIR_BACKUP}
cp -r -v ${DIR_IMG} ${DIR_BACKUP}

# compress css 1 normalize.css
if [ -e ${DIR_CSS}/${CSS_1} ] ; then
sed -i -e 's/^[ \t]*//g; s/[ \t]*$//g; s/\([:{;,]\) /\1/g; s/ {/{/g; s/\/\*.*\*\///g; /^$/d' ${DIR_CSS}/${CSS_1}
sed -i -e :a -e '$!N; s/\n\(.\)/\1/; ta' ${DIR_CSS}/${CSS_1}
else
sleep 0
fi

# compress css 2 style.css 
if [ -e ${DIR_CSS}/${CSS_2} ] ; then
sed -i -e 's/^[ \t]*//g; s/[ \t]*$//g; s/\([:{;,]\) /\1/g; s/ {/{/g; s/\/\*.*\*\///g; /^$/d' ${DIR_CSS}/${CSS_2}
sed -i -e :a -e '$!N; s/\n\(.\)/\1/; ta' ${DIR_CSS}/${CSS_2}
else
sleep 0
fi

# compress html files loop
for f in ${INDEXHTML} ${DIR_TAGS}/*.html
do
sed -i ':a;N;$!ba;s/>\s*</></g' $f 
done
}

BROWSER(){
${BROWSER} ${INDEXHTML}
}

INFO(){
echo "BashBlog v1.0 - 2021"
echo "--------------------"
echo -ne "BLOG POSTS: " ; grep -wc "\<article class=\"article-post\"" ${INDEXHTML}
echo -ne "TAGS: " ; ls -la ${DIR_TAGS} |grep -e "^-"|wc -l
echo -ne "CSS: " ; ls -la ${DIR_CSS} |grep -e "^-"|wc -l
echo -ne "IMG: " ; ls -la ${DIR_IMG} |grep -e "^-"|wc -l
echo -ne "${INDEXHTML}: " ; du -hs ${INDEXHTML} | cut -f1
echo -ne "${DIR_TAGS}/: " ; du -hs ${DIR_TAGS} | cut -f1
echo -ne "${DIR_CSS}/: " ; du -hs ${DIR_CSS} | cut -f1
echo -ne "${DIR_IMG}/: " ; du -hs ${DIR_IMG} | cut -f1
}

MENU(){
clear
echo "BashBlog v1.0"
echo "============="
PS3='Please enter your choice: '
options=("New" "Add post blog" "Delete post blog" "Add link" "Delete link" "Compress" "Browser" "Information" "Quit")
select opt in "${options[@]}"
do
    case "${opt}" in
         "New") NEW                                                        ;;
         "Add post blog") CHECK_FILES ; CHECK_COMPRESS  ; BASE_HTML        ;;
	 "Delete post blog") CHECK_FILES ; CHECK_COMPRESS ; DEL_POST_BLOG  ;;
         "Add link") CHECK_FILES ; CHECK_COMPRESS ; ADD_LINK	           ;;
         "Delete link") CHECK_FILES ; CHECK_COMPRESS ; DEL_LINK	           ;;
         "Compress") CHECK_FILES ; CHECK_COMPRESS ; COMPRESS	           ;;
    	 "Browser") CHECK_FILES ; BROWSER                                  ;;
	 "Information") CHECK_FILES ; INFO                                 ;;
         "Quit") break                                                     ;;
        *) echo "Invalid option: "${REPLY}""                               ;;
    esac
done
}

HELP()
{
cat <<EOF
bashblog v1.0
This script creates a base for a website in html5, configure the variables in in double quotes, do not change the paths, the html files are created through the BASE_HTML fuction.
USAGE:
./bashblog [OPTIONS]
Arguments:
   -new | -n
     Create necessary files and folders
   
   -add-post-blog | -apb
     Adds new post to blog
   
   -del-post-blog | -dpb
     Delete post blog
    
   -add-link | -al
     Adds new link
   
   -del-link | -dl
     Delete link
   
   -compress | -c
     compress all html files 
   
   -browser | -b
     Opens website in browser
   
   -info | -f
     Shows number of posts and number of html tags files 
   
    -menu | -m
     Menu mode 

EOF
}

case $1 in
             "-new" | "-n")	 NEW						;				;;
             "-add-post-blog" | "-apb") CHECK_FILES ; CHECK_COMPRESS  ; BASE_HTML		;		;;
             "-del-post-blog" | "-dpb") CHECK_FILES ; CHECK_COMPRESS ; DEL_POST_BLOG		;		;;
			 "-add-link" | "-al")	CHECK_FILES ; CHECK_COMPRESS ; ADD_LINK		;		;;
             "-del-link" | "-dl")	CHECK_FILES ; CHECK_COMPRESS ; DEL_LINK			;		;;
             "-compress" | "-c")	CHECK_FILES ; CHECK_COMPRESS ; COMPRESS			;		;;
             "-browser" | "-b")	CHECK_FILES ; BROWSER				;				;;
             "-info" | "-f")	CHECK_FILES ; INFO				;				;;
             "-menu" | "-m")	MENU						;				;;
                *)   HELP							;  exit 1		;	;;
esac
