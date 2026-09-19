(() => {
  const tools = document.querySelector('[data-filter-tools]');
  if (!tools) return;
  const posts = [...document.querySelectorAll('[data-post]')];
  const buttons = [...tools.querySelectorAll('[data-filter]')];
  const search = tools.querySelector('[data-search]');
  const empty = document.querySelector('[data-empty]');
  let category = 'all';
  function filterPosts() {
    const query = search.value.trim().toLocaleLowerCase();
    let count = 0;
    posts.forEach(post => {
      const matches = (category === 'all' || post.dataset.category === category)
        && post.dataset.searchText.toLocaleLowerCase().includes(query);
      post.hidden = !matches;
      if (matches) count++;
    });
    empty.hidden = count > 0;
  }
  buttons.forEach(button => button.addEventListener('click', () => {
    category = button.dataset.filter;
    buttons.forEach(item => {
      const active = item === button;
      item.classList.toggle('active', active);
      item.setAttribute('aria-pressed', String(active));
    });
    filterPosts();
  }));
  search.addEventListener('input', filterPosts);
  tools.hidden = false;
  filterPosts();
})();
