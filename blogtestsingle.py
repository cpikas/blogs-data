from bs4 import BeautifulSoup

# from http://stackoverflow.com/questions/24502139/using-beautifulsoup-to-pull-multiple-posts-from-a-single-blog-archive-page-with

posts_file = open ("posts.txt","w")

soup = BeautifulSoup(open('cd_page_45.htm'))

posts = []

for post in soup.find_all('div', class_='post'):
    title = post.find('h2').text.strip()
    url = post.find('h2').a.get('href')
    content = post.find('div', class_='entry clear').p.text.strip()
    date = post.find('div', class_='date').text.strip()

    posts.append({'title': title,
                  'url' : url,
                  'content': content,
                  'date': date})
print posts
posts = str(posts)
posts_file.write (posts)
	
print ("All done!")
	
posts_file.close()