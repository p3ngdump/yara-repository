rule win_invisimole_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.invisimole."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.invisimole"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 8bf1 83f807 760a c786a4af0600c8af4000 33db 899e78af0600 399e70af0600 }
            // n = 7, score = 100
            //   8bf1                 | mov                 esi, ecx
            //   83f807               | cmp                 eax, 7
            //   760a                 | jbe                 0xc
            //   c786a4af0600c8af4000     | mov    dword ptr [esi + 0x6afa4], 0x40afc8
            //   33db                 | xor                 ebx, ebx
            //   899e78af0600         | mov                 dword ptr [esi + 0x6af78], ebx
            //   399e70af0600         | cmp                 dword ptr [esi + 0x6af70], ebx

        $sequence_1 = { 740a 8b4f14 51 ff15???????? 80bf4602000000 740d 8b9748020000 }
            // n = 7, score = 100
            //   740a                 | je                  0xc
            //   8b4f14               | mov                 ecx, dword ptr [edi + 0x14]
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   80bf4602000000       | cmp                 byte ptr [edi + 0x246], 0
            //   740d                 | je                  0xf
            //   8b9748020000         | mov                 edx, dword ptr [edi + 0x248]

        $sequence_2 = { 6888130000 ffd7 6a01 8d4c2438 51 8d54242c 52 }
            // n = 7, score = 100
            //   6888130000           | push                0x1388
            //   ffd7                 | call                edi
            //   6a01                 | push                1
            //   8d4c2438             | lea                 ecx, [esp + 0x38]
            //   51                   | push                ecx
            //   8d54242c             | lea                 edx, [esp + 0x2c]
            //   52                   | push                edx

        $sequence_3 = { 8d8d60ffffff e9???????? ff15???????? 898563ffffff 8b45df 898567ffffff }
            // n = 6, score = 100
            //   8d8d60ffffff         | lea                 ecx, [ebp - 0xa0]
            //   e9????????           |                     
            //   ff15????????         |                     
            //   898563ffffff         | mov                 dword ptr [ebp - 0x9d], eax
            //   8b45df               | mov                 eax, dword ptr [ebp - 0x21]
            //   898567ffffff         | mov                 dword ptr [ebp - 0x99], eax

        $sequence_4 = { 83c404 85f6 0f84a1000000 8b5ddf 81fb08020000 0f8392000000 8b7df8 }
            // n = 7, score = 100
            //   83c404               | add                 esp, 4
            //   85f6                 | test                esi, esi
            //   0f84a1000000         | je                  0xa7
            //   8b5ddf               | mov                 ebx, dword ptr [ebp - 0x21]
            //   81fb08020000         | cmp                 ebx, 0x208
            //   0f8392000000         | jae                 0x98
            //   8b7df8               | mov                 edi, dword ptr [ebp - 8]

        $sequence_5 = { 7505 897b04 eb06 8b5308 897a08 a1???????? }
            // n = 6, score = 100
            //   7505                 | jne                 7
            //   897b04               | mov                 dword ptr [ebx + 4], edi
            //   eb06                 | jmp                 8
            //   8b5308               | mov                 edx, dword ptr [ebx + 8]
            //   897a08               | mov                 dword ptr [edx + 8], edi
            //   a1????????           |                     

        $sequence_6 = { 8d85e4fbffff 50 ffd6 8d8dc0f9ffff 51 8d95e4fbffff 52 }
            // n = 7, score = 100
            //   8d85e4fbffff         | lea                 eax, [ebp - 0x41c]
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   8d8dc0f9ffff         | lea                 ecx, [ebp - 0x640]
            //   51                   | push                ecx
            //   8d95e4fbffff         | lea                 edx, [ebp - 0x41c]
            //   52                   | push                edx

        $sequence_7 = { 5b 8be5 5d c3 8b16 c7463078563412 c7463489674523 }
            // n = 7, score = 100
            //   5b                   | pop                 ebx
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   8b16                 | mov                 edx, dword ptr [esi]
            //   c7463078563412       | mov                 dword ptr [esi + 0x30], 0x12345678
            //   c7463489674523       | mov                 dword ptr [esi + 0x34], 0x23456789

        $sequence_8 = { 33c9 d1e8 66890c46 66833e2a ba01000000 895dc3 c645bc0d }
            // n = 7, score = 100
            //   33c9                 | xor                 ecx, ecx
            //   d1e8                 | shr                 eax, 1
            //   66890c46             | mov                 word ptr [esi + eax*2], cx
            //   66833e2a             | cmp                 word ptr [esi], 0x2a
            //   ba01000000           | mov                 edx, 1
            //   895dc3               | mov                 dword ptr [ebp - 0x3d], ebx
            //   c645bc0d             | mov                 byte ptr [ebp - 0x44], 0xd

        $sequence_9 = { e8???????? 83c404 84c0 0f8431ffffff 68???????? ffd6 8d7c0002 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   84c0                 | test                al, al
            //   0f8431ffffff         | je                  0xffffff37
            //   68????????           |                     
            //   ffd6                 | call                esi
            //   8d7c0002             | lea                 edi, [eax + eax + 2]

    condition:
        7 of them and filesize < 139264
}