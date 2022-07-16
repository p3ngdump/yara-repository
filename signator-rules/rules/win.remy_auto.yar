rule win_remy_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.remy."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.remy"
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
        $sequence_0 = { 8945e4 394b08 7708 e8???????? 8b7d20 8b730c 037310 }
            // n = 7, score = 200
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   394b08               | cmp                 dword ptr [ebx + 8], ecx
            //   7708                 | ja                  0xa
            //   e8????????           |                     
            //   8b7d20               | mov                 edi, dword ptr [ebp + 0x20]
            //   8b730c               | mov                 esi, dword ptr [ebx + 0xc]
            //   037310               | add                 esi, dword ptr [ebx + 0x10]

        $sequence_1 = { 898520dfffff 898524dfffff 898528dfffff 89852cdfffff 53 8d8518dfffff 8bfe }
            // n = 7, score = 200
            //   898520dfffff         | mov                 dword ptr [ebp - 0x20e0], eax
            //   898524dfffff         | mov                 dword ptr [ebp - 0x20dc], eax
            //   898528dfffff         | mov                 dword ptr [ebp - 0x20d8], eax
            //   89852cdfffff         | mov                 dword ptr [ebp - 0x20d4], eax
            //   53                   | push                ebx
            //   8d8518dfffff         | lea                 eax, [ebp - 0x20e8]
            //   8bfe                 | mov                 edi, esi

        $sequence_2 = { 8d550c 52 33c0 57 56 c78534ffffff00000000 898538ffffff }
            // n = 7, score = 200
            //   8d550c               | lea                 edx, [ebp + 0xc]
            //   52                   | push                edx
            //   33c0                 | xor                 eax, eax
            //   57                   | push                edi
            //   56                   | push                esi
            //   c78534ffffff00000000     | mov    dword ptr [ebp - 0xcc], 0
            //   898538ffffff         | mov                 dword ptr [ebp - 0xc8], eax

        $sequence_3 = { 8bf0 56 e8???????? 8d4c241f 51 8d7c2434 }
            // n = 6, score = 200
            //   8bf0                 | mov                 esi, eax
            //   56                   | push                esi
            //   e8????????           |                     
            //   8d4c241f             | lea                 ecx, [esp + 0x1f]
            //   51                   | push                ecx
            //   8d7c2434             | lea                 edi, [esp + 0x34]

        $sequence_4 = { 57 50 8d45f4 64a300000000 8b450c 898510ffffff }
            // n = 6, score = 200
            //   57                   | push                edi
            //   50                   | push                eax
            //   8d45f4               | lea                 eax, [ebp - 0xc]
            //   64a300000000         | mov                 dword ptr fs:[0], eax
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   898510ffffff         | mov                 dword ptr [ebp - 0xf0], eax

        $sequence_5 = { 50 898568dfffff c78594efffff000c0000 899d34dfffff 899d30dfffff ff15???????? }
            // n = 6, score = 200
            //   50                   | push                eax
            //   898568dfffff         | mov                 dword ptr [ebp - 0x2098], eax
            //   c78594efffff000c0000     | mov    dword ptr [ebp - 0x106c], 0xc00
            //   899d34dfffff         | mov                 dword ptr [ebp - 0x20cc], ebx
            //   899d30dfffff         | mov                 dword ptr [ebp - 0x20d0], ebx
            //   ff15????????         |                     

        $sequence_6 = { e8???????? c644247008 8b16 8b4c2434 8b442430 8911 894104 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   c644247008           | mov                 byte ptr [esp + 0x70], 8
            //   8b16                 | mov                 edx, dword ptr [esi]
            //   8b4c2434             | mov                 ecx, dword ptr [esp + 0x34]
            //   8b442430             | mov                 eax, dword ptr [esp + 0x30]
            //   8911                 | mov                 dword ptr [ecx], edx
            //   894104               | mov                 dword ptr [ecx + 4], eax

        $sequence_7 = { 8bce c74424700f000000 c744246c00000000 c644245c00 e8???????? 6a04 68???????? }
            // n = 7, score = 200
            //   8bce                 | mov                 ecx, esi
            //   c74424700f000000     | mov                 dword ptr [esp + 0x70], 0xf
            //   c744246c00000000     | mov                 dword ptr [esp + 0x6c], 0
            //   c644245c00           | mov                 byte ptr [esp + 0x5c], 0
            //   e8????????           |                     
            //   6a04                 | push                4
            //   68????????           |                     

        $sequence_8 = { e8???????? 83c404 8b45dc 8b4df4 64890d00000000 59 5f }
            // n = 7, score = 200
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8b45dc               | mov                 eax, dword ptr [ebp - 0x24]
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   64890d00000000       | mov                 dword ptr fs:[0], ecx
            //   59                   | pop                 ecx
            //   5f                   | pop                 edi

        $sequence_9 = { 8b542430 83ec18 8bc4 8908 8b4c244c 895004 894808 }
            // n = 7, score = 200
            //   8b542430             | mov                 edx, dword ptr [esp + 0x30]
            //   83ec18               | sub                 esp, 0x18
            //   8bc4                 | mov                 eax, esp
            //   8908                 | mov                 dword ptr [eax], ecx
            //   8b4c244c             | mov                 ecx, dword ptr [esp + 0x4c]
            //   895004               | mov                 dword ptr [eax + 4], edx
            //   894808               | mov                 dword ptr [eax + 8], ecx

    condition:
        7 of them and filesize < 507904
}