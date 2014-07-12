
from bs4 import BeautifulSoup
import os, os.path
# grand scheme to write the dictionary directly to csv but it doesn't know it's a dictionary
# probably worth looking into at some point
# import csv


# from http://stackoverflow.com/questions/24502139/using-beautifulsoup-to-pull-multiple-posts-from-a-single-blog-archive-page-with

posts_file = open ("posts.txt","w")

def pullcontent(filename):

	#probably should have used the os change directory command instead
	completefilename = "cdfiles/" + filename
	print completefilename
	soup = BeautifulSoup(open(completefilename))
	posts = []
	for post in soup.find_all('div', class_='post'):
	    title = post.find('h2').text.strip()
	    url = post.find('h2').a.get('href')
	    content = post.find('div', class_='entry clear').text.strip()
	    date = post.find('div', class_='date').text.strip()

	    posts.append({'title': title,
			  'url' : url,
			  'content': content,
			  'date': date})

	#csv.DictWriter(open('cdposts.csv', 'wb'), fieldnames=posts[posts.keys()[0]].keys(), delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
	#print posts
	posts = str(posts)
	posts_file.write (posts)
	
# this is a directory of files with the full content of blog archive pages
# each page has a number of posts on it

for filename in os.listdir("cdfiles"):
	print(filename)
	pullcontent(filename)



print ("All done!")
	


posts_file.close()
	

