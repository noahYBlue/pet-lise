const table = document.getElementsByClassName('table');

for (let i = 0; i < table.length; i++) {
  table[i].innerHTML += `
  <thead>
    <tr>
      <th>이달 여부</th>
      <th>카테고리</th>
      <th>제목</th>
      <th>작성자</th>
      <th>등록일</th>
      <th>삭제여부</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><input type="checkbox" name="" id=""></td>
      <td>일반식 [습식]</td>
      <td>레시피 제목인듯 아닌듯 맞는듯 함 레시피 제목인듯 아닌듯 맞는듯 함 레시피 제목인듯 아닌듯 맞는듯 함</td>
      <td>강낭콩</td>
      <td>2022.02.22</td>
      <td>삭제</td>
    </tr>
  </tbody>
  `;
}