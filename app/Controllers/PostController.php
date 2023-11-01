<?php

namespace App\Controllers;
use App\Models\PostModel;

class PostController extends BaseController
{
    public function ejercicio01()
    {
    $db= \Config\Database::connect();
    $posts = $db->query('select c.category, p.id, p.title, u.username, p.created_at
    from categories as c right join posts as p on p.category
    = c.id left join users as u on u.id = p.autor where p.created_at 
    between "2023/01/01" and "2023/12/31" ')->getResultArray();

$data= ['posts' =>$posts];
    return view('posts/ejercicio01', $data);
    }


    public function ejercicio02()
    {
    $db= \Config\Database::connect();
    $posts = $db->query('	
	
	select concat (ui.name, " ",ui.lastname) as "Nombre Completo", p.title, c.category
	from userinfo as ui
	join users as u
	on ui.id= u.id
	join posts as p
	on p.autor= ui.id
	join categories as c
	on ui.id= c.id
	order by "c.id" desc limit 1;

')->getResultArray();

$data= [
    'posts' =>$posts
    ];
    return view('posts/ejercicio02', $data);
    }


    public function ejercicio03()
    {
    $db= \Config\Database::connect();
    $posts = $db->query('
	select concat (ui.name, " ",ui.lastname) as "Nombre Completo", ui.birthday,
	ui.phone, p.title, p.status
	from userinfo as ui
	join users as u
	on ui.id= u.id
	join posts as p
	on p.autor= ui.id 
	where p.status=0 limit 100;
	')->getResultArray();

$data= ['posts' =>$posts];
    return view('posts/ejercicio03', $data);
    }

    public function ejercicio04()
    {
    $db= \Config\Database::connect();
    $posts = $db->query('
	select concat (ui.name, " ",ui.lastname) as "Nombre Completo", u.username, 
	ui.birthday, ui.gender, p.created_at
	from userinfo as ui join users as u
	on ui.id= u.id join posts as p
	on p.autor= ui.id
	where p.created_at between "2022/01/01" and "2022/12/31" 
	order by p.created_at asc;
	')->getResultArray();

$data= ['posts' =>$posts];
    return view('posts/ejercicio04', $data);
    }


	public function ejercicio05()
	{

		$db = \Config\Database::connect();
		$totalUsers = $db->query('select count(*) as "totalUsuarios" from users')->getResultArray();

		$totalPosts = $db->query('select count(*) as "totalPublicaciones" from posts')->getResultArray();
		
		$totalComments = $db->query('select count(*) as "totalComentarios" from comments')->getResultArray();

		$totalCategories = $db->query('select count(*) as "totalCategorias" from categories')->getResultArray();

		$data = [
			'totalUsers'		=> $totalUsers,
			'totalPosts'		=> $totalPosts,
			'totalComments'		=> $totalComments,
			'totalCategories'	=> $totalCategories
		];

		return view('posts/ejercicio05', $data);
	}

 	public function ejercicio06()
	{
		$db = \Config\Database::connect();
		$postsPorCategoria = $db->query('select p.*, c.category as ccategory, count(*) 
        as ppc from categories as c join posts as p on p.category = c.id group by category 
        order by category')->getResultArray();
		$postsPorAutor = $db->query('select p.*, u.id as pautor, count(*) 
        as ppa from users as u join posts as p on p.autor = u.id group by autor
        order by autor')->getResultArray();

		$data = [
			'postsPorCategoria' => $postsPorCategoria,
			'postsPorAutor' 	=> $postsPorAutor
		];

		return view('posts/ejercicio06', $data);
	}


	public function ejercicio07()
	{
		$db = \Config\Database::connect();

		$postsEscritosPorMujeres2022 = $db->query('select p.*, count(*) as pepm22, u.*, ui.* 
		from posts as p join users as u on p.autor = u.id join userinfo as ui on u.id = ui.id 
		where ui.gender = "f" and p.created_at between "2022/01/01" and "2022/12/31"')->getResultArray();

		$postsEscritosPorMujeres2023 = $db->query('select p.*, count(*) as pepm23, u.*, ui.* 
		from posts as p join users as u on p.autor = u.id join userinfo as ui on u.id = ui.id 
		where ui.gender = "f" and p.created_at between "2023/01/01" and "2023/12/31"')->getResultArray();

		$postsEscritosPorHombres2022 = $db->query('select p.*, count(*) as peph22, u.*, ui.* 
		from posts as p join users as u on p.autor = u.id join userinfo as ui on u.id = ui.id 
		where ui.gender = "m" and p.created_at between "2022/01/01" and "2022/12/31"')->getResultArray();

		$postsEscritosPorHombres2023 = $db->query('select p.*, count(*) as peph23, u.*, ui.* 
		from posts as p join users as u on p.autor = u.id join userinfo as ui on u.id = ui.id 
		where ui.gender = "m" and p.created_at between "2023/01/01" and "2023/12/31"')->getResultArray();

		$data = [
			'postsEscritosPorMujeres2022'	=> $postsEscritosPorMujeres2022,
			'postsEscritosPorMujeres2023'	=> $postsEscritosPorMujeres2023,
			'postsEscritosPorHombres2022'		=> $postsEscritosPorHombres2022,
			'postsEscritosPorHombres2023'		=> $postsEscritosPorHombres2023,
		];

		return view('posts/ejercicio07', $data);
	}


	public function ejercicio08()
	{
		$db = \Config\Database::connect();
		$postsPorCategoria = $db->query('select p.*, c.category as ccategory, count(*) 
        as ppc from categories as c join posts as p on p.category = c.id group by category 
        order by count(*) desc;
		
		')->getResultArray();
		$postsPorAutor = $db->query('select p.*, u.id as pautor, count(*) 
        as ppa from users as u join posts as p on p.autor = u.id group by autor
        order by count(*) desc')->getResultArray();

		$data = [
			'postsPorCategoria' => $postsPorCategoria,
			'postsPorAutor' 	=> $postsPorAutor
		];

		return view('posts/ejercicio08', $data);
	}

    public function ejercicio09()
    {
    $db= \Config\Database::connect();
    $posts = $db->query('select p.title, p.content, c.category, u.profile
    from categories as c right join posts as p on p.category
    = c.id left join users as u on u.id = p.autor 
	where u.profile=1 

	 ')->getResultArray();

$data= ['posts' =>$posts];
    return view('posts/ejercicio09', $data);
    }



	public function ejercicio10()
	{
		$db = \Config\Database::connect();

		$postsEscritosPorMujeresMenor30 = $db->query('select p.*, count(*) as pepm30, u.*, ui.* 
		from posts as p join users as u on p.autor = u.id join userinfo as ui on u.id = ui.id 
		where ui.gender = "f" and ui.birthday between "2023/10/08" and "1993/10/08" order by
		p.title desc
		')->getResultArray();

		$postsEscritosPorHombresMayor16 = $db->query('select p.*, count(*) as peph16, u.*, ui.* 
		from posts as p join users as u on p.autor = u.id join userinfo as ui on u.id = ui.id 
		where ui.gender = "m" and ui.birthday between "1900/10/08" and "2007/10/08" order by
		p.title desc
		')->getResultArray();


		$postsH = $db->query('	
		select p.title
		from posts as p
		join userinfo as ui
		on p.autor= ui.id
		order by "ui.gender" desc limit 1;	
		')->getResultArray();

		$postsM = $db->query('	
		select p.title
		from posts as p
		join userinfo as ui
		on p.autor= ui.id
		order by "ui.gender" asc limit 1;
	
	')->getResultArray();


		$data = [
			'postsEscritosPorMujeresMenor30'	=> $postsEscritosPorMujeresMenor30,
			'postsEscritosPorHombresMayor16'		=> $postsEscritosPorHombresMayor16,
			'postsH'=>$postsH,
			'postsM'=>$postsM
		];

		return view('posts/ejercicio10', $data);
	}


}