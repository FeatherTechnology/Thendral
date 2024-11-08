<?php
session_start();
include("./ajaxconfig.php");
include_once("./api/config-file.php");

session_destroy();   
echo "<script>location.href='".HOSTPATH."'</script>"; 
