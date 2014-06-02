import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1	

ApplicationWindow
{
	title: "Prover";
	width: 800;
	height: 600;
	visible: true;
	
	// Układ i podkomponeny
	RowLayout
	{
		anchors.fill: parent;
		anchors.margins: spacing;
		
		ColumnLayout
		{
			TabView
			{
				id: tabs;
				
				Layout.fillWidth: true;
				Layout.fillHeight: true;
				Layout.minimumWidth: 200;
				Layout.minimumHeight: 200;
				tabPosition: Qt.BottomEdge;
				
				Tab
				{
					title: "Drzewo prawdy";
					
					ScrollView
					{
						// TEMP
						Tree
						{
							root: TreeNode
							{
								value: "523+123";
								character: "+";
								valueLabel: nodeValue;
								TreeNode {value: "523"; character: ""; valueLabel: nodeValue;}
								TreeNode {value: "123"; character: ""; valueLabel: nodeValue;}
							}
						}
						// END TEMP
					}
				}
				
				Tab
				{
					title: "Drzewo wyrażenia";
					
					ScrollView
					{
						// TEMP
						Tree
						{
							root: TreeNode
							{
								value: "X!q"; character: "X"; valueLabel: nodeValue;
								TreeNode
								{
									value: "!q"; character: "!"; valueLabel: nodeValue;
									TreeNode {value: "q"; character: ""; valueLabel: nodeValue;}
								}
							}
						}
						// END TEMP
					}
				}
			}
			
			Label
			{
				id: nodeValue;
			}
		}
		
		ColumnLayout
		{
			Layout.alignment: Qt.AlignTop | Qt.AlignLeft;
			
			HeaderLabel
			{
				text: "Predykaty";
			}
			
			TableView
			{
				Layout.minimumHeight: 100;
			}
			
			RowLayout
			{
				anchors.horizontalCenter: parent.horizontalCenter;
				ToolButton
				{
					iconSource: "img/add.svg";
					tooltip: "Dodaj";
				}
				
				ToolButton
				{
					iconSource: "img/edit.svg";
					tooltip: "Edytuj";
				}
				
				ToolButton
				{
					iconSource: "img/delete.svg";
					tooltip: "Usuń";
				}
				
				ToolButton
				{
					iconSource: "img/load.svg";
					tooltip: "Wczytaj z pliku";
				}
			}
			
			HeaderLabel
			{
				text: "Konkluzja";
			}
			
			RowLayout
			{
				Layout.maximumWidth: 200;
				
				Label
				{
					Layout.fillWidth: true;
					elide: Text.ElideRight;
				}
				
				ToolButton
				{
					iconSource: "img/edit.svg";
					tooltip: "Edytuj";
				}
			}
			
			HeaderLabel
			{
				text: "Wynik";
			}
			
			Label
			{
				text: "Nie obliczono";
			}
			
			Button
			{
				implicitWidth: 200;
				text: "Rozłóż";
			}
			
			RowLayout
			{
				anchors.horizontalCenter: parent.horizontalCenter;
				ToolButton
				{
					iconSource: "img/zoomIn.svg";
					tooltip: "Powiększ";
					
					onClicked:
					{
						var currentTree = tabs.getTab(tabs.currentIndex).children[0].children[0];
						var newScale = currentTree.scale + 0.1;
						currentTree.scale = newScale > 1 ? 1 : newScale;
					}
				}
				
				ToolButton
				{
					iconSource: "img/zoomOut.svg";
					tooltip: "Pomniejsz";
					
					onClicked:
					{
						var currentTree = tabs.getTab(tabs.currentIndex).children[0].children[0];
						var newScale = currentTree.scale - 0.1;
						currentTree.scale = newScale < 0.1 ? 0.1 : newScale;
					}
				}
			}
		}
	}
	
	// Overlay'e dialogowe
	FormulaOverlay {}
	ProgressOverlay {}
}